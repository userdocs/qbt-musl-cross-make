#!/usr/bin/bash

#################################################################################################################################################
# Global color variables for main script sections
#################################################################################################################################################
color_red="\e[31m"
color_green="\e[32m"
color_yellow="\e[33m"
color_blue="\e[34m"
color_cyan="\e[36m"
color_magenta="\e[35m"
color_gray="\e[37m"
color_end="\e[0m"
text_bold="\e[1m"

apply_patches() {
	local patch_dir="${1:-patches}"
	local dry_run="${2:-false}"
	local verbose="${3:-false}"
	local force="${4:-false}"
	local git_repo="${5:-}"
	local failed_patches_file="${6:-}"
	local delete_failed="${7:-false}"
	local caller_dir="${PWD}"
	local original_dir="${PWD}"

	#################################################################################################################################################
	# Display DRY RUN mode warning if enabled - let the user know what's going on
	#################################################################################################################################################
	if [[ $dry_run == true ]]; then
		printf '\n%b%b%s%b\n' "${text_bold}" "${color_yellow}" "=== DRY RUN MODE (Default) ===" "${color_end}"
		printf '\n%b%s%b\n' "${color_gray}" "This script is running in DRY RUN mode and will NOT apply any patches." "${color_end}"
		printf '\n%b%s%b\n' "${color_green}" "Use '--apply' or '-a' flag to actually apply patches." "${color_end}"
		printf '\n%b%b%s%b\n' "${text_bold}" "${color_yellow}" "================================" "${color_end}"
	fi

	#################################################################################################################################################
	# Color me up Scotty - define some color values to use as variables in the scripts.
	#################################################################################################################################################

	# Unicode circles - the main symbols used throughout the script
	local unicode_red_circle="\e[31m\U2B24\e[0m"
	local unicode_green_circle="\e[32m\U2B24\e[0m"
	local unicode_yellow_circle="\e[33m\U2B24\e[0m"
	local unicode_blue_circle="\e[34m\U2B24\e[0m"

	# Array to track failed patches
	local failed_patches=()

	# Handle git repository directory
	local is_git_repo="false"
	if [[ -n $git_repo ]]; then
		# If git_repo is not an absolute path, make it relative to caller's directory
		if [[ ! $git_repo =~ ^/ ]]; then
			git_repo="${caller_dir}/${git_repo}"
		fi

		if [[ ! -d $git_repo ]]; then
			printf '\n%b Target directory %b%s%b not found\n' "${unicode_red_circle}" "${color_blue}" "'$git_repo'" "${color_end}"
			return 1
		fi

		if [[ -d $git_repo/.git ]]; then
			is_git_repo="true"
			printf '\n%b Changing to git repository: %b%s%b\n' "${unicode_blue_circle}" "${color_blue}" "$git_repo" "${color_end}"
		else
			is_git_repo="false"
			printf '\n%b Changing to directory (not a git repo): %b%s%b\n' "${unicode_blue_circle}" "${color_blue}" "$git_repo" "${color_end}"
		fi

		cd "$git_repo" || {
			printf '\n%b %s\n' "${unicode_red_circle}" "Failed to change to target directory"
			return 1
		}
	else
		git_repo="${PWD}"
		if [[ -d .git ]]; then
			is_git_repo="true"
		else
			is_git_repo="false"
		fi
	fi

	# If patch_dir is not an absolute path, make it relative to caller's directory
	if [[ ! $patch_dir =~ ^/ ]]; then
		patch_dir="${caller_dir}/${patch_dir}"
	fi

	if [[ ! -d $patch_dir ]]; then
		printf '\n%b Patch directory %b%s%b not found\n' "${unicode_red_circle}" "${color_blue}" "$patch_dir" "${color_end}"
		cd "$original_dir" || printf '\n%b %s\n' "${unicode_yellow_circle}" "Warning: Failed to return to original directory"
		return 1
	fi

	# Check if there are any patch files in the directory
	local patch_count=0
	for patch_file in "$patch_dir"/*.{patch,diff}; do
		[[ -f $patch_file ]] && ((patch_count++))
	done

	if [[ $patch_count -eq 0 ]]; then
		printf '\n%b %bWARNING:%b No patch files found in directory %b%s%b\n' "${unicode_yellow_circle}" "${color_yellow}" "${color_end}" "${color_blue}" "$patch_dir" "${color_end}"
		printf '\n%b %bExpected file extensions:%b .patch or .diff\n' "${unicode_blue_circle}" "${color_cyan}" "${color_end}"
		printf '\n%b %bExample patch files:%b\n\n' "${unicode_blue_circle}" "${color_cyan}" "${color_end}"
		printf '   %b- fix-bug.patch%b\n' "${color_green}" "${color_end}"
		printf '   %b- update-version.diff%b\n' "${color_green}" "${color_end}"
		printf '   %b- security-patch.patch%b\n' "${color_green}" "${color_end}"
		cd "$original_dir" || printf '\n%b %s\n' "${unicode_yellow_circle}" "Warning: Failed to return to original directory"
		return 1
	fi

	if [[ $is_git_repo == "true" ]]; then
		if [[ $dry_run == "true" ]]; then
			printf '\n%b %bDRY RUN:%b Checking patches from %b%s%b for git repository %b%s%b...\n' "${unicode_blue_circle}" "${color_yellow}" "${color_end}" "${color_blue}" "$patch_dir" "${color_end}" "${color_blue}" "$git_repo" "${color_end}"
		else
			printf '\n%b %bAPPLYING:%b patches from %b%s%b to git repository %b%s%b...\n' "${unicode_red_circle}" "${color_red}" "${color_end}" "${color_blue}" "$patch_dir" "${color_end}" "${color_blue}" "$git_repo" "${color_end}"
		fi
	else
		if [[ $dry_run == "true" ]]; then
			printf '\n%b %bDRY RUN:%b Checking patches from %b%s%b for directory %b%s%b (using patch command)...\n' "${unicode_blue_circle}" "${color_yellow}" "${color_end}" "${color_blue}" "$patch_dir" "${color_end}" "${color_blue}" "$git_repo" "${color_end}"
		else
			printf '\n%b %bAPPLYING:%b patches from %b%s%b to directory %b%s%b (using patch command)...\n' "${unicode_red_circle}" "${color_red}" "${color_end}" "${color_blue}" "$patch_dir" "${color_end}" "${color_blue}" "$git_repo" "${color_end}"
		fi
	fi

	for patch_file in "$patch_dir"/*.{patch,diff}; do
		[[ -f $patch_file ]] || continue

		printf '\n%b Processing: %b%s%b\n' "${unicode_blue_circle}" "${color_cyan}" "$(basename "$patch_file")" "${color_end}"

		if [[ $dry_run == "true" ]]; then
			if [[ $is_git_repo == "true" ]]; then
				if [[ $verbose == "true" ]]; then
					if git apply --check --verbose "$patch_file" 2> /dev/null; then
						printf '\n  %b %bOK%b\n' "${unicode_green_circle}" "${color_green}" "${color_end}"
					else
						printf '  %b %bFailed%b\n' "${unicode_red_circle}" "${color_red}" "${color_end}"
						failed_patches+=("$(basename "$patch_file")")
						error_message=$(git apply --check "$patch_file" 2>&1)
						printf '  %b %bReason:%b\n' "${unicode_yellow_circle}" "${color_yellow}" "${color_end}"
						printf '%s\n' "$error_message" | sed 's/^/      /'
					fi
				else
					if git apply --check "$patch_file" 2> /dev/null; then
						printf '\n  %b %bOK%b\n' "${unicode_green_circle}" "${color_green}" "${color_end}"
					else
						printf '  %b %bFailed%b\n' "${unicode_red_circle}" "${color_red}" "${color_end}"
						failed_patches+=("$(basename "$patch_file")")
						error_message=$(git apply --check "$patch_file" 2>&1 | head -1)
						printf '  %b %bReason:%b\n' "${unicode_yellow_circle}" "${color_yellow}" "${color_end}"
						printf '%s\n' "$error_message" | sed 's/^/      /'
					fi
				fi
			else
				# Use patch command for non-git directories
				if [[ $verbose == "true" ]]; then
					if patch --dry-run -p1 -i "$patch_file" > /dev/null 2>&1; then
						printf '\n  %b %bOK%b\n' "${unicode_green_circle}" "${color_green}" "${color_end}"
					else
						printf '\n  %b %bFailed%b\n' "${unicode_red_circle}" "${color_red}" "${color_end}"
						failed_patches+=("$(basename "$patch_file")")
						error_message=$(patch --dry-run -p1 -i "$patch_file" 2>&1)
						printf '  %b %bReason:%b\n' "${unicode_yellow_circle}" "${color_yellow}" "${color_end}"
						printf '%s\n' "$error_message" | sed 's/^/      /'
					fi
				else
					if patch --dry-run -p1 -i "$patch_file" > /dev/null 2>&1; then
						printf '\n  %b %bOK%b\n' "${unicode_green_circle}" "${color_green}" "${color_end}"
					else
						printf '\n  %b %bFailed%b\n' "${unicode_red_circle}" "${color_red}" "${color_end}"
						failed_patches+=("$(basename "$patch_file")")
						error_message=$(patch --dry-run -p1 -i "$patch_file" 2>&1 | head -1)
						printf '  %b %bReason:%b\n' "${unicode_yellow_circle}" "${color_yellow}" "${color_end}"
						printf '%s\n' "$error_message" | sed 's/^/      /'
					fi
				fi
			fi
		else
			local applied="false"
			local error_message=""

			if [[ $is_git_repo == "true" ]]; then
				# Git repository - use git apply
				if git apply "$patch_file" 2> /dev/null; then
					printf '\n  %b %bApplied%b\n' "${unicode_green_circle}" "${color_green}" "${color_end}"
					applied="true"
				elif git apply --3way "$patch_file" 2> /dev/null; then
					printf '  %b %bApplied with 3-way merge%b\n' "${unicode_green_circle}" "${color_green}" "${color_end}"
					applied="true"
				elif [[ $force == "true" ]] && git apply --ignore-whitespace "$patch_file" 2> /dev/null; then
					printf '  %b %bApplied (ignored whitespace)%b\n' "${unicode_green_circle}" "${color_green}" "${color_end}"
					applied="true"
				elif [[ $force == "true" ]] && git apply --reject "$patch_file" 2> /dev/null; then
					printf '  %b %bApplied with reject files (check .rej files for conflicts)%b\n' "${unicode_yellow_circle}" "${color_yellow}" "${color_end}"
					applied="true"
				else
					# Capture the error message
					error_message=$(git apply "$patch_file" 2>&1)
				fi
			else
				# Non-git directory - use patch command
				if patch -p1 -i "$patch_file" > /dev/null 2>&1; then
					printf '\n  %b %bApplied%b\n' "${unicode_green_circle}" "${color_green}" "${color_end}"
					applied="true"
				elif [[ $force == "true" ]] && patch --ignore-whitespace -p1 -i "$patch_file" > /dev/null 2>&1; then
					printf '  %b %bApplied (ignored whitespace)%b\n' "${unicode_green_circle}" "${color_green}" "${color_end}"
					applied="true"
				elif [[ $force == "true" ]] && patch --reject-file=- -p1 -i "$patch_file" > /dev/null 2>&1; then
					printf '  %b %bApplied with reject files (check .rej files for conflicts)%b\n' "${unicode_yellow_circle}" "${color_yellow}" "${color_end}"
					applied="true"
				else
					# Capture the error message
					error_message=$(patch -p1 -i "$patch_file" 2>&1)
				fi
			fi

			if [[ $applied == "false" ]]; then
				printf '\n  %b %bFailed to apply%b\n' "${unicode_red_circle}" "${color_red}" "${color_end}"
				printf '  %b %bReason:%b\n' "${unicode_yellow_circle}" "${color_yellow}" "${color_end}"
				printf '%s\n' "$error_message" | sed 's/^/      /'
				if [[ $verbose == "true" ]]; then
					printf '\n%b%s%b\n' "${color_yellow}" "    Detailed error:" "${color_end}"
					if [[ $is_git_repo == "true" ]]; then
						git apply --check --verbose "$patch_file" 2>&1 | sed 's/^/      /'
					else
						patch --dry-run -p1 -i "$patch_file" 2>&1 | sed 's/^/      /'
					fi
					printf '\n%b     To fix this patch, try one of these approaches: %b\n' "${color_yellow}" "${color_end}"
					if [[ $is_git_repo == "true" ]]; then
						printf '\n%b  1.%b%b Manual 3-way merge:%b   git apply --3way --verbose %b%s%b\n' "${color_magenta}" "${color_end}" "${color_green}" "${color_end}" "${color_cyan}" "'$patch_file'" "${color_end}"
						printf '\n%b  2.%b%b Ignore whitespace:%b    git apply --ignore-whitespace %b%s%b\n' "${color_magenta}" "${color_end}" "${color_green}" "${color_end}" "${color_cyan}" "'$patch_file'" "${color_end}"
						printf '\n%b  3.%b%b Check what failed:%b    git apply --check --verbose %b%s%b\n' "${color_magenta}" "${color_end}" "${color_green}" "${color_end}" "${color_cyan}" "'$patch_file'" "${color_end}"
						printf '\n%b  4.%b%b Apply with reject:%b    git apply --reject %b%s%b\n' "${color_magenta}" "${color_end}" "${color_green}" "${color_end}" "${color_cyan}" "'$patch_file'" "${color_end}"
					else
						printf '\n%b     1.%b%b Ignore whitespace:%b    patch --ignore-whitespace -p1 -i %b%s%b\n' "${color_magenta}" "${color_end}" "${color_green}" "${color_end}" "${color_cyan}" "'$patch_file'" "${color_end}"
						printf '\n%b     2.%b%b Check what failed:%b    patch --dry-run -p1 -i %b%s%b\n' "${color_magenta}" "${color_end}" "${color_green}" "${color_end}" "${color_cyan}" "'$patch_file'" "${color_end}"
						printf '\n%b     3.%b%b Apply with reject:%b    patch --reject-file=- -p1 -i %b%s%b\n' "${color_magenta}" "${color_end}" "${color_green}" "${color_end}" "${color_cyan}" "'$patch_file'" "${color_end}"
						printf '\n%b     4.%b%b Try different strip:%b  patch -p0 -i %b%s%b\n' "${color_magenta}" "${color_end}" "${color_green}" "${color_end}" "${color_cyan}" "'$patch_file'" "${color_end}"
					fi
					printf '\n%b     5.%b%b View patch content:%b   cat %b%s%b\n' "${color_magenta}" "${color_end}" "${color_cyan}" "${color_end}" "${color_yellow}" "'$patch_file'" "${color_end}"
					printf '\n%b     6.%b%b Apply manually:%b       patch -p1 < %b%s%b\n' "${color_magenta}" "${color_end}" "${color_cyan}" "${color_end}" "${color_yellow}" "'$patch_file'" "${color_end}"
				fi
			fi
		fi
	done

	# Save failed patches to file if requested and in dry run mode
	if [[ $dry_run == "true" && -n $failed_patches_file && ${#failed_patches[@]} -gt 0 ]]; then
		# If failed_patches_file is not an absolute path, make it relative to caller's directory
		local output_file="$failed_patches_file"
		if [[ ! $output_file =~ ^/ ]]; then
			output_file="${caller_dir}/${failed_patches_file}"
		fi

		printf '\n%b Saving %b%d%b failed patch file names to: %b%s%b\n' "${unicode_blue_circle}" "${color_yellow}" "${#failed_patches[@]}" "${color_end}" "${color_blue}" "$output_file" "${color_end}"
		printf '%s\n' "${failed_patches[@]}" > "$output_file"
		if [[ $? -eq 0 ]]; then
			printf '%b %b%s%b\n' "${unicode_green_circle}" "${color_green}" "Failed patches saved successfully" "${color_end}"
		else
			printf '%b %b%s%b\n' "${unicode_yellow_circle}" "${color_yellow}" "Warning: Failed to save failed patches to file" "${color_end}"
		fi
	fi

	# Delete failed patches if requested and in dry run mode
	if [[ $dry_run == "true" && $delete_failed == "true" && ${#failed_patches[@]} -gt 0 ]]; then
		printf '\n%b Deleting %b%d%b failed patch files from: %b%s%b\n\n' "${unicode_red_circle}" "${color_red}" "${#failed_patches[@]}" "${color_end}" "${color_blue}" "$patch_dir" "${color_end}"
		local deleted_count=0
		local failed_count=0

		for patch_name in "${failed_patches[@]}"; do
			local patch_path="$patch_dir/$patch_name"
			if [[ -f $patch_path ]]; then
				if rm "$patch_path" 2> /dev/null; then
					printf '  %b %bDeleted:%b %b%s%b\n' "${unicode_green_circle}" "${color_green}" "${color_end}" "${color_cyan}" "$patch_name" "${color_end}"
					((deleted_count++))
				else
					printf '  %b %bFailed to delete:%b %b%s%b\n' "${unicode_red_circle}" "${color_red}" "${color_end}" "${color_yellow}" "$patch_name" "${color_end}"
					((failed_count++))
				fi
			else
				printf '  %b %bNot found:%b %b%s%b\n' "${unicode_yellow_circle}" "${color_yellow}" "${color_end}" "${color_blue}" "$patch_name" "${color_end}"
				((failed_count++))
			fi
		done

		if [[ $deleted_count -gt 0 ]]; then
			printf '\n%b %b%s%b\n' "${unicode_green_circle}" "${color_green}" "Successfully deleted $deleted_count failed patch file(s)" "${color_end}"
		fi
		if [[ $failed_count -gt 0 ]]; then
			printf '%b %b%s%b\n' "${unicode_yellow_circle}" "${color_yellow}" "Warning: Failed to delete $failed_count patch file(s)" "${color_end}"
		fi
	fi

	# Return to original directory
	cd "$original_dir" || printf '\n%s\n' "Warning: Failed to return to original directory"
}

# Main execution when script is called directly
if [[ ${BASH_SOURCE[0]} == "${0}" ]]; then

	# Show usage if no arguments provided
	if [[ $# -eq 0 ]]; then
		printf '\n%b%s%b\n' "${color_cyan}" "Usage: $0 [OPTIONS] [patch_directory]" "${color_end}"
		printf '\n%b%s%b\n' "${color_cyan}" "Check patches from a directory (dry run by default). Use --apply to actually apply them." "${color_end}"
		printf '\n%b%s%b\n' "${color_yellow}" "Basic examples:" "${color_end}"
		printf '\n%b%s%b%b%s%b\n' "${color_green}" "  $0 my-patches                 " "${color_end}" "${color_cyan}" " # Check patches from 'my-patches' directory (dry run)" "${color_end}"
		printf '\n%b%s%b%b%s%b\n' "${color_green}" "  $0 -a my-patches              " "${color_end}" "${color_cyan}" " # Apply patches from 'my-patches' directory" "${color_end}"
		printf '\n%b%s%b%b%s%b\n' "${color_green}" "  $0 -r /path/to/repo my-patches" "${color_end}" "${color_cyan}" " # Check patches for specific directory" "${color_end}"
		printf '\n%b%s%b\n' "${color_blue}" "Use '$0 --help' for detailed options and usage information." "${color_end}"
		printf '\n'
		exit 0
	fi

	dry_run="true"
	verbose="false"
	force="false"
	patch_dir=""
	git_repo=""
	failed_patches_file=""
	delete_failed_patches="false"

	# Parse command line arguments
	while [[ $# -gt 0 ]]; do
		case $1 in
			-d | --dry-run)
				dry_run="true"
				shift
				;;
			-a | --apply)
				dry_run="false"
				shift
				;;
			-v | --verbose)
				verbose="true"
				shift
				;;
			-f | --force)
				force="true"
				shift
				;;
			-r | --repo)
				if [[ -n $2 && ! $2 =~ ^- ]]; then
					git_repo="$2"
					shift 2
				else
					printf '\n%b%s%b\n' "${color_red}" "Error: --repo requires a directory argument" "${color_end}" >&2
					exit 1
				fi
				;;
			-s | --save-failed)
				if [[ -n $2 && ! $2 =~ ^- ]]; then
					failed_patches_file="$2"
					shift 2
				else
					printf '\n%b%s%b\n' "${color_red}" "Error: --save-failed requires a file path argument" "${color_end}" >&2
					exit 1
				fi
				;;
			-x | --delete-failed)
				delete_failed_patches="true"
				shift
				;;
			-h | --help)
				printf '\n%b%s%b\n' "${color_cyan}" "Usage: $0 [OPTIONS] [patch_directory]" "${color_end}"
				printf '\n%b%s%b\n' "${color_yellow}" "Options:" "${color_end}"
				printf '\n%b%s%b\n' "${color_gray}" "  -d, --dry-run            Only check patches without applying them (default)" "${color_end}"
				printf '\n%b%s%b\n' "${color_gray}" "  -a, --apply              Actually apply patches (overrides default dry run)" "${color_end}"
				printf '\n%b%s%b\n' "${color_gray}" "  -v, --verbose            Show detailed output for debugging" "${color_end}"
				printf '\n%b%s%b\n' "${color_gray}" "  -f, --force              Try harder to apply patches (ignore whitespace, use reject files)" "${color_end}"
				printf '\n%b%s%b\n' "${color_gray}" "  -r, --repo DIR           Target directory to apply patches to (git repo or regular directory)" "${color_end}"
				printf '\n%b%s%b\n' "${color_gray}" "  -s, --save-failed FILE   Save failed patch file names to specified file (dry run only)" "${color_end}"
				printf '\n%b%s%b\n' "${color_gray}" "  -x, --delete-failed      Delete failed patch files from patch directory (dry run only)" "${color_end}"
				printf '\n%b%s%b\n' "${color_gray}" "  -h, --help               Show this help message" "${color_end}"
				printf '\n%b%s%b\n' "${color_yellow}" "Arguments:" "${color_end}"
				printf '\n%b%s%b\n' "${color_gray}" "  patch_directory          Directory containing .patch or .diff files (default: 'patches')" "${color_end}"
				printf '\n%b%s%b\n' "${color_gray}" "                           Can be absolute or relative to current working directory" "${color_end}"
				printf '\n%b%s%b\n' "${color_magenta}" "The script automatically detects if the target is a git repository:" "${color_end}"
				printf '\n%b%s%b\n' "${color_gray}" "  - Git repositories: Uses 'git apply' with 3-way merge support" "${color_end}"
				printf '\n%b%s%b\n' "${color_gray}" "  - Regular directories: Uses 'patch' command" "${color_end}"
				printf '\n%b%s%b\n' "${color_yellow}" "Examples:" "${color_end}"
				printf '\n%b%s%b%b%s%b\n' "${color_green}" "  $0 my-patches                    " "${color_end}" "${color_cyan}" "    # Check patches from './my-patches' (dry run)" "${color_end}"
				printf '\n%b%s%b%b%s%b\n' "${color_green}" "  $0 -a my-patches                " "${color_end}" "${color_cyan}" "     # Apply patches from './my-patches' to current directory" "${color_end}"
				printf '\n%b%s%b%b%s%b\n' "${color_green}" "  $0 -a -r /path/to/repo patches   " "${color_end}" "${color_cyan}" "    # Apply patches from './patches' to specified directory" "${color_end}"
				printf '\n%b%s%b%b%s%b\n' "${color_green}" "  $0 -r my-repo my-patches         " "${color_end}" "${color_cyan}" "    # Check patches from './my-patches' for './my-repo'" "${color_end}"
				printf '\n%b%s%b%b%s%b\n' "${color_green}" "  $0 --repo ../other-project patches   " "${color_end}" "${color_cyan}" "# Check patches from './patches' for '../other-project'" "${color_end}"
				printf '\n%b%s%b%b%s%b\n' "${color_green}" "  $0 /abs/patches -r /abs/dir      " "${color_end}" "${color_cyan}" "    # Check patches using absolute paths" "${color_end}"
				printf '\n%b%s%b%b%s%b\n' "${color_green}" "  $0 -d patches                    " "${color_end}" "${color_cyan}" "    # Explicitly specify dry run (same as default)" "${color_end}"
				printf '\n%b%s%b%b%s%b\n' "${color_green}" "  $0 -a -v -f my-patches           " "${color_end}" "${color_cyan}" "    # Apply with verbose output and force mode" "${color_end}"
				printf '\n%b%s%b%b%s%b\n' "${color_green}" "  $0 -d -s failed.txt patches      " "${color_end}" "${color_cyan}" "    # Dry run and save failed patches to 'failed.txt'" "${color_end}"
				printf '\n%b%s%b%b%s%b\n' "${color_green}" "  $0 -d -s /tmp/fails.list patches " "${color_end}" "${color_cyan}" "    # Dry run and save failed patches with absolute path" "${color_end}"
				printf '\n%b%s%b%b%s%b\n' "${color_green}" "  $0 -d -x patches                 " "${color_end}" "${color_cyan}" "    # Dry run and delete failed patches from patch directory" "${color_end}"
				printf '\n%b%s%b%b%s%b\n' "${color_green}" "  $0 -d -x -v patches              " "${color_end}" "${color_cyan}" "    # Dry run, delete failed patches, and show verbose output" "${color_end}"
				printf '\n%b%s%b\n' "${color_yellow}" "Fixing Failed Patches:" "${color_end}"
				printf '\n%b%s%b\n' "${color_gray}" "  When patches fail, the script suggests recovery methods based on target type:" "${color_end}"
				printf '\n%b%s%b\n' "${color_cyan}" "  Git repositories:" "${color_end}"
				printf '\n%b%s%b\n' "${color_gray}" "    1. 3-way merge: Attempts to merge conflicts automatically" "${color_end}"
				printf '\n%b%s%b\n' "${color_gray}" "    2. Ignore whitespace: Handles whitespace-only differences" "${color_end}"
				printf '\n%b%s%b\n' "${color_gray}" "    3. Reject files: Creates .rej files for manual resolution" "${color_end}"
				printf '\n%b%s%b\n' "${color_cyan}" "  Regular directories:" "${color_end}"
				printf '\n%b%s%b\n' "${color_gray}" "    1. Ignore whitespace: Handles whitespace-only differences" "${color_end}"
				printf '\n%b%s%b\n' "${color_gray}" "    2. Different strip levels: Try -p0 instead of -p1" "${color_end}"
				printf '\n%b%s%b\n' "${color_gray}" "    3. Reject files: Creates .rej files for manual resolution" "${color_end}"
				printf '\n'
				exit 0
				;;
			-*)
				printf '\n%b%s%b\n' "${color_red}" "Unknown option: $1" "${color_end}" >&2
				printf '\n%b%s%b\n' "${color_blue}" "Use -h or --help for usage information" "${color_end}" >&2
				exit 1
				;;
			*)
				if [[ -z $patch_dir ]]; then
					patch_dir="$1"
				else
					printf '\n%b%s%b\n' "${color_red}" "Error: Multiple patch directories specified" "${color_end}" >&2
					exit 1
				fi
				shift
				;;
		esac
	done

	# Set default patch directory if not specified
	if [[ -z $patch_dir ]]; then
		patch_dir="patches"
	fi

	apply_patches "$patch_dir" "$dry_run" "$verbose" "$force" "$git_repo" "$failed_patches_file" "$delete_failed_patches"
fi

printf '\n'
