{
  "kind": "ServiceSpec",
  "apiVersion": "hyscale.io/v1/",
  "metadata": {
    "name": "hrms-frontend",
    "version": 1,
    "replicas": "{{ hfs_REPLICAS | default('1') }}",
    "resourceLimits": {
      "memory": "{{ hfs_MEMORY_LIMIT_IN_MB | default('512') }}"
    },
    "labels": {
      "tier": "frontend",
      "externalPorts": [
        8080
      ]
    },
    "dependencies": [
      "hrms-db"
    ],
    "deployProps": [
      {
        "key": "BUILD_NUM",
        "value": "{{ hfs_BUILD_NUM | default ('1.0.1') }}"
      }
    ]
  },
  "spec": {
    "external": [
      "tomcat-port"
    ],
    "stack": {
      "name": "hrms-tomcat2",
      "version": "8.5",
      "packages": [
        "java:1.8",
        "apache-tomcat:8.5.15"
      ],
      "os": "Ubuntu:14.04",
      "distribution" : "DEBIAN"
    },
    "artifacts": [
      {
        "name": "HRScaffold_war",
        "destination": "/usr/local/content/tomcat/current/webapps/hrms.war",
        "source": {
          "store": "Jfrog",
          "repository": "HRScaffold",
          "path": "${BUILD_NUM}/HRScaffold.war"
        }
      }
    ],
    "dataDirectories": [
      {
        "name": "tomcat-logs",
        "path": "/usr/local/content/tomcat/current/logs",
        "readOnly": false,
        "sizeInGB": "{{ hfs_LOG_SIZE_IN_GB | default('1') }}",
        "storageClass": "{{ hfs_STORAGE_CLASS | default('standard') }}"
      }
    ],
    "sidecars":[
        {
        "name":"fluentd",
        "version": "6.4",
        "configProps":[{
                "key": "FLUENTD_ARGS",
                "value": "{{ hfs_FLUENTD_ARGS | default('--no-supervisor -vv') }}"
                },
                {
                "key": "system.input.conf",
                 "type": "FILE",
                "value": "{{ hfs_SYSTEM_INPUT_CONF | default('/tmp/system.input.conf') }}"
                },
                {
                "key": "output.conf",
                 "type": "FILE",
                "value": "{{ hfs_OUTPUT_CONF | default('/tmp/output.conf') }}"
                }],
        "volumes":[{"path": "/mnt/log",
                  "name": "tomcat-logs"}]
        }
        ],
    "config": {
      "props": [
        {
          "key": "JAVA_HOME",
          "value": "{{ hfs_JAVA_HOME | default('/usr/local/java') }}"
        },
        {
          "key": "TOMCAT_HOME",
          "value": "{{ hfs_TOMCAT_HOME | default('/usr/local/content/tomcat') }}"
        },
        {
          "key": "COUNTRY",
          "value": "{{ hfs_COUNTRY | default('INDIA') }}"
        },
        {
          "key": "REGION",
          "value": "{{ hfs_REGION | default('HYD') }}"
        },
        {
          "key": "MAX_NO_OF_THREADS",
          "value": "{{hfs_MAX_NO_OF_THREADS | default('10') }}"
        },
        {
          "key": "MAX_NO_OF_CONNECTIONS",
          "value": "{{ hfs_MAX_NO_OF_CONNECTIONS | default('10') }}"
        },
	{
          "key": "MYSQL_HOST",
	  "type": "ENDPOINT",
          "value": "{{ hfs_MYSQL_HOST | default('HYD') }}"
        }
      ]
    }
  }
}
