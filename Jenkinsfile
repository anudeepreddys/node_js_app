pipeline{

	agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub-cred-anudeepreddys')
	}

	stages {

		stage('Build') {

			steps {
				sh 'docker build -t anudeepreddys/ngnix_custom:$BUILD_NUMBER .'
			}
		}

		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'docker push anudeepreddys/ngnix_custom:$BUILD_NUMBER'
			}
		}
		stage('Deploying App to Kubernetes') {
      		steps {
        		script {
          			kubeconfig(credentialsId: 'eks_config', serverUrl: '') {
						sh 'pwd'
						sh 'ls'
   						sh 'kubectl apply -f deploymentservice.yml'
					}
       			 }
      		}
    	}
		stage('email alert'){
			steps {
				script
					emailext body: 'build successful', subject: 'build succeded', to: 'solleti.anudeep76@gmail.com'4
			}
		}
	}
}