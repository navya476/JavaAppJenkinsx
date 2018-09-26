pipeline {
  options {
    disableConcurrentBuilds()
  }
  agent {
    kubernetes {
      label "module-1"
      yaml """
apiVersion: v1
kind: Pod
metadata:
  labels:
    application: "module-1"
  ci: true
spec:
  containers:
  - name: docker-dind
    image: docker:dind
    command:  ["sh"]
    args: ["-c","dockerd --host=unix:///var/run/docker.sock --host=tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock "]
    tty: true 
    securityContext:
      privileged: true
"""
    }
  }
  environment {
    DEPLOY_NAMESPACE = "production"
  }
  stages {
			stage('Build') {
				
				steps {
				  container('docker-dind') {
						  
					 sh '''
                     docker build -t config-server .
					 '''
				   }
				   }
				   }
  }
  
  }
