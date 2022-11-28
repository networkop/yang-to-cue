package main

import (
	"encoding/json"
	"tool/exec"
	"tool/file"
	"tool/cli"
)

device: {
	address:  "172.20.20.2:6030"
	username: "admin"
	password: "admin"
}

gnmic_set_prefix: ["gnmic", "-a", device.address, "-u", device.username, "-p", device.password, "--insecure", "--gzip", "set"]

command: apply: {
	gnmic: exec.Run & {
		cmd:    gnmic_set_prefix + ["--update-path", "/", "--update-file", "-"]
		stdin:  json.Marshal(config)
		stdout: string
	}
}
command: show: {
	cli.Print & {
		text: json.Indent(json.Marshal(config), "", "   ")
	}
}

command: save: {
	file.Create & {
		filename: "cue.json"
		contents: json.Indent(json.Marshal(config), "", "   ")
	}
}
