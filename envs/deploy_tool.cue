package deploy

import (
	"tool/cli"
	"tool/file"
	"tool/exec"
	"encoding/yaml"
)

appName: string | *"cuekapp" @tag(appName)

objStream: yaml.MarshalStream(myapp.objects)

command: deploy: exec.Run & {
	cmd:   "kapp deploy -y -a \(appName) -f - --diff-changes"
	stdin: objStream
}

command: diff: exec.Run & {
	cmd:   "kapp deploy -y -a \(appName) -f - --diff-run"
	stdin: objStream
}

command: debug: cli.Print & {
	text: objStream
}

command: dump: file.Create & {
    filename: "dump.yaml"
    contents: objStream
}
