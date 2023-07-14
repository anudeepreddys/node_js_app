pipeline{

	agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub-cred-anudeepreddys')
	}

	stages {

		stage('Build') {

			steps {
				sh 'docker build -t anudeepreddys/ngnix_custom:latest .'
			}
		}

		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'docker push anudeepreddys/ngnix_custom:latest'
			}
		}
	}
}