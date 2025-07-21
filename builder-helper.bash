#!/bin/bash

color_red="\e[31m" color_red_light="\e[91m"
color_green="\e[32m" color_green_light="\e[92m"
color_yellow="\e[33m" color_yellow_light="\e[93m"
color_blue="\e[34m" color_blue_light="\e[94m"
color_magenta="\e[35m" color_magenta_light="\e[95m"
color_cyan="\e[36m" color_cyan_light="\e[96m"
text_bold="\e[1m" text_dim="\e[2m" text_underlined="\e[4m" text_blink="\e[5m" text_newline="\n"
color_end="\e[0m"

[[ -f triples.json ]] || {
	printf '\n%b\n\n' "${color_red} Error:${color_end} ${color_blue_light}triples.json${color_end} is missing?"
	exit
}

target="${1:-$target}"

# Create indexed array and populate it
readarray -t arch_array < <(jq -r '.arch_type[]' triples.json)

if [[ -z $1 && -z $target ]]; then
	printf '\n%b\n' " ${color_cyan}./build-helper.sh${color_end} ${color_yellow}target${color_end}"
	printf '\n%b\n\n' " ${text_underlined}Available targets:${color_end}"

	# Display the architectures
	for arch in "${arch_array[@]}"; do
		printf ' %b\n' " ${color_yellow}$arch${color_end}"
	done

	printf '\n'
	exit 0
fi

# Check if $target is set and matches a value in arch_array
if [[ -n "$target" ]]; then
	target_found=false
	for arch in "${arch_array[@]}"; do
		if [[ "$target" == "$arch" ]]; then
			target_found=true
			break
		fi
	done

	if [[ "$target_found" == false ]]; then
		printf '\n%b\n\n' "${color_red} Error:${color_end} target ${color_yellow}$target${color_end} does not match an architecture in triples.json"
		exit 1
	fi
fi

target_config=$(jq -r --arg arch "${target}" '.include[] | select(.arch_type == $arch) | .arch_config' triples.json)

if [[ -z "$target_config" ]]; then
    printf '\n%b\n\n' "${color_red} Error:${color_end} Architecture ${color_yellow}${1}${color_end} config is null?"
	exit 1
fi

printf '\n%b\n' " ${color_green}target:${color_end} ${color_yellow}${target}${color_end}"
printf '%b\n\n' " ${color_green}config:${color_end} ${color_blue_light}${target_config}${color_end}"

case "$(arch)" in
	"x86_64")
		docker_platform="amd64"
		;;
	"aarch64" | "")
		docker_platform="arm64"
		;;
	*)
		# Default case for unknown options
		printf '%b\n' "Unsupported build host: ${2}"
		exit 1
		;;
esac

threads="$(nproc)"

printf '%b\n\n' " ${text_dim}${text_underlined}These are the target specific commands you can run manually:${color_end}"

printf '%b\n\n' " sed -i \"s|^GCC_CONFIG_FOR_TARGET +=.*|GCC_CONFIG_FOR_TARGET += ${target_config}|\" config.mak"
printf '%b\n\n' " docker run --platform=linux/${docker_platform} -w /root -v $(pwd):/root alpine:edge"
printf '%b\n' " apk add -u --no-cache autoconf automake bash bison build-base \ "
printf '%b\n' " curl findutils flex git libarchive-tools libtool linux-headers \ "
printf '%b\n\n' " musl-dev patch perl pkgconf rsync tar texinfo xz zip zlib-dev zlib-static"
printf '%b\n\n' " make -j${threads} install TARGET=\"${target}\" OUTPUT=\"build/${target}\" | tee ${target}-build.log"
printf '%b\n' " cd \"build\""
printf '%b\n\n' " XZ_OPT=-9T0 tar -cvJf ${target}.tar.xz ${target}/"

printf '%b\n\n' " ${text_dim}${text_underlined}Or do this command to have them done for you:${color_end}"
printf '%b\n\n' " ${color_magenta}./build-helper.sh${color_end} ${color_yellow}${target}${color_end} ${color_green}build${color_end}"

if [[ "${2}" == "build" ]]; then
	sed -i "s|^GCC_CONFIG_FOR_TARGET +=.*|GCC_CONFIG_FOR_TARGET += ${target_config}|" config.mak
	docker run --platform=linux/${docker_platform} -w /root -v "$(pwd)":/root alpine:edge /bin/sh -c "
        apk update && \
        apk add -u --no-cache autoconf automake bash bison build-base \
            curl findutils flex git libarchive-tools libtool linux-headers \
            musl-dev patch perl pkgconf rsync tar texinfo xz zip zlib-dev zlib-static && \
        git config --global --add safe.directory '*' && \
        make -j${threads} install TARGET=\"${target}\" OUTPUT=\"/root/build/${target}\" | tee ${target}-build.log && \
        cd \"build\" && \
        XZ_OPT=-9T0 tar -cvJf ${target}.tar.xz ${target}/"
fi
