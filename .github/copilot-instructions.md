In a reusable workflow, to use the outputs of a job, it must be included in the needs section of the job trying to use the outputs. Always check a reusable job with outputs has the required needs to prevent null variables.

Make any workflow code provided by copilot does not use outdated actions.

gh cli cannot get the id of a workflow it started with gh run workflow. you need to list them after and get the id.
