package app

import (
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#Config: {
	name: string & !=""
	meta: metav1.#ObjectMeta
	image: {
		repository: string & !=""
		tag:        string & !=""
	}
	selectorLabels: *{"app.kubernetes.io/name": name} | {[string]: string}

	service: {
		type:         *"ClusterIP" | "LoadBalancer" | "LoadBalancer"
		httpPort:     int | *80
		externalPort: int | *8080
	}
}
