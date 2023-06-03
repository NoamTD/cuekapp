# deploy

This directory contains a description of the environments the app will be deployed to.

Each directory is a [cue instance](https://cuelang.org/docs/concepts/packages/#instances) with overrides for the specific environment.

## Commands

The [cue scripting layer](https://cuelang.org/docs/usecases/scripting/) is utilized to describe a set of commands that can be used to interact with the k8s definitions generated from cue.

The following commands are supported:

- `cue cmd deploy ./ENV` - deploy app to an environment
- `cue cmd diff ./ENV` - display a diff between the current cluster state and the repo state
- `cue cmd dump ./ENV` - dump the generated yaml definitions to stdout. The output can be piped to the `kapp` tool for an interactive deployment experience

## Deploying to a cluster

`kapp` allows for displaying a diff with a prompt, for validating changes before applying them to a cluster. Since `cue` scripting makes it difficult to interact with such prompts, the process is split in two:

1. generate the k8s YAMLs
2. pipe them to `kapp`, passing whichever flags are desired.

For example, to deploy the dev app:

```bash
cue cmd dump ./dev | kapp deploy -f - -a cuekapp --diff-changes 
```
