pipeline {
  agent any
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
  }
  stages {
    stage('gitclone') {

	steps {
		git 'https://github.com/raymondogbe/Landing-Page-React.git'
		}
	}
    stage('Build Docker Image') {
            steps {
                // Build the Docker image from Dockerfile
              sh "docker build -t  erplyapp . "
            }
        }
    //stage('Run Docker Container') {
            //steps {
                // Run the Docker container from the built image
              //sh "docker run -dit -p 80:80 --name erply_app erplyapp"
               // }
           // }
    stage('Docker Login') {
      steps {
        sh "echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin"
      }
    }
    stage('Docker Tag Image') {
      steps {
        sh "docker tag erplyapp raydebillion/erplyapp:${BUILD_NUMBER}"
      }
    }
    stage('Docker Push') {
      steps {
        sh "docker push raydebillion/erplyapp:${BUILD_NUMBER}"
      }
    }
   stage('Deploying React App to Kubernetes') {
      steps {
        script {
          sh ('aws eks update-kubeconfig --name erply --region us-west-1')
          sh "kubectl get ns"
	  sh "kubectl apply -f service.yaml"
          sh "kubectl apply -f deployment.yaml"
        }
      }
    }
  }
}
