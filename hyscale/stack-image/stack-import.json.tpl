{
  "kind": "Stack",
  "apiVersion": "hyscale.io/v1/",
  "metadata": {
    "name": "tomcat",
    "version": "lts"
  },
  "spec": {
    "stack": {
      "name": "tomcatvv",
      "version": "lts",
      "docker-registry": "dockerhub",
      "importImage": "library/tomcat:8",
      "ports": [
        {
          "name": "port1",
          "type": "http",
          "port": 8080,
          "default": 8080
        },
        {
          "name": "port2",
          "type": "http",
          "port": "[8000,9000]",
          "default": 8000
        },
        {
          "name": "port3",
          "type": "http",
          "port": "8001-8888",
          "default": 8001
        }
      ],
      "os": "Ubuntu 16.04",
      "configProps": [
        {
          "key": "TOMCAT_HOME",
          "value": "/usr/local/tomcat/"
        }
      ]
    }
  }
}
