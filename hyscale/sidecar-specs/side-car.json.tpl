{
  "kind": "Sidecar",
  "apiVersion": "hyscale.io/v1/",
  "metadata": {
    "name": "fluentd-cli",
    "version": "1.0"
  },
  "spec": {
    "sidecar": {
      "name": "fluentd-cli",
      "version": "1.0",
      "docker-registry": "srihari",
      "importImage": "fluentd-elasticsearch:4.2",
      "ports": [
        {
          "name": "port1",
          "type": "http",
          "port": 8080,
        }
      ],
      "dataDirectories": ["/mnt/hrms/logs/"],
      "configProps": [
        {
          "key": "TOMCAT_HOME",
          "value": "/usr/local/tomcat/"
        }
      ]
    }
  }
}
