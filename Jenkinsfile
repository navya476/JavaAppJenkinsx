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
