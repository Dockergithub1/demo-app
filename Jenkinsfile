pipeline {
    agent any

    environment {
        IMAGE_NAME = "demo-app"
        CONTAINER_NAME = "demo-app-container"
        PORT = "3000"
    }

    stages {
        stage('Checkout') {
            steps {
                git credentialsId: '1d76f922-a638-46b0-b7e1-91a21fe6600a', url: 'https://github.com/Dockergithub1/demo-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat "docker build -t %IMAGE_NAME% ."
            }
        }

        stage('Run Tests') {
            steps {
                bat "node test.js"
            }
        }

        stage('Run Container') {
            steps {
                bat "docker rm -f %CONTAINER_NAME% || exit 0"
                bat "docker run -d --name %CONTAINER_NAME% -p %PORT%:3000 %IMAGE_NAME%"
            }
        }
    }

    post {
        success {
            echo "Build and deployment successful! App running at http://localhost:%PORT%/"
        }
        failure {
            echo "Build failed!"
        }
    }
}
