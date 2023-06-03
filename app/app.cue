package app

#Application: {
	config: #Config

	deployment: #Deployment & {_config: config}
	service:    #Service & {_config:    config}

	objects: [
		deployment,
		service,
	]
}
