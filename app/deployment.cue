package app

import (
	appsv1 "k8s.io/api/apps/v1"
)

#Deployment: appsv1.#Deployment & {
	_config: #Config

	apiVersion: "apps/v1"
	kind:       "Deployment"
	metadata:   _config.meta
	spec: {
		replicas: 3
		selector: matchLabels: _config.selectorLabels
		template: {
			metadata: labels: _config.selectorLabels
			spec: {
				containers: [
					{
						name:  "app"
						image: "\(_config.image.repository):\(_config.image.tag)"
						ports: [
							{
								name:          "http"
								containerPort: _config.service.httpPort
								protocol:      "TCP"
							},
						]
					},
				]
			}
		}
	}
}
