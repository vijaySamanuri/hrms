{
  "kind": "Stack",
  "apiVersion": "hyscale.io/v1/",
  "metadata": {
    "name": "tomcat-check1",
    "version": "8.5"
  },
  "spec": {
    "stack": {
      "name": "tomcat-check0000",
      "version": "8.5",
      "packages": [
	"mysql-new:5.6"
      ],
      "os": "Ubuntu 14.04"
      "configProps": [
        {
          "key": "TOMCAT_HOME",
          "value": "/usr/local/tomcat/"
        }
      ]
    }
  }
}
