---
kind: Stack
apiVersion: hyscale.io/v1/
metadata:
  name: tomcat
  version: lts
spec:
  stack:
    name: hys-postgres4
    version: 15
    docker-registry: satya-simtech
    importImage: tomcat
    os: Ubuntu 16.04
    configProps:
    - key: TOMCAT_HOME
      value: "/usr/local/tomcat/"

