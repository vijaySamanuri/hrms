{
  "kind": "ServiceSpec",
  "apiVersion": "hyscale.io/v1/",
  "metadata": {
    "name": "kibana",
    "internalendpoint": "kibana",
    "version": 1,
    "replicas": "{{ kibana_REPLICAS | default('1') }}",
    "resourceLimits": {
      "memory": "{{ kibana_MEMORY_LIMIT_IN_MB | default('512') }}"
    },
    "labels": {
      "tier": "frontend",
      "externalPorts": [
        5601
      ]
    }
  },
  "spec": {
    "external": [
      "kibana"
    ],
    "stack": {
      "name": "es-kibana",
      "version": "6.3.1",
      "docker-registry": "dockerhub",
      "importImage": "elasticsearch-kibana",
      "ports": [
        {
          "name": "kibana",
          "type": "http",
          "port": 5601,
          "default": 5601
        },
        {
          "name": "es",
          "type": "http",
          "port": "9200",
          "default": 9200
        }
	],
      "os": "Ubuntu:14.04"
    }
  }
}
