package deploy

import "github.com/noamtd/cuekapp/app"

myapp: app.#Application & {
	config: {
		meta: {
			name: N
		}
		N=name: "myapp"
		image: {
			repository: "nginx"
			tag:        "latest"
		}
		service: {
			externalPort: 8080
		}
	}
}
