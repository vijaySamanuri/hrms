---
kind: Stack
apiVersion: hyscale.io/v1/
metadata:
  name: tomcat-check1
  version: '8.5'
spec:
  stack:
    name: tomcat-check1
    version: '8.5'
    packages:
    - java:1.8
    - apache-tomcat:8.5.15
    os: Ubuntu 14.04
    configProps:
    - key: TOMCAT_HOME
      value: "/usr/local/tomcat/"

