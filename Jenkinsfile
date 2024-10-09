pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
               // Specify 'main' branch instead of 'master'
               git branch: 'main', url: 'https://github.com/Chakrapani240286/hello-world-html'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'docker build -t my-html-app .'
                    } else {
                        bat 'docker build -t my-html-app .'
                    }
                }
            }
        }

        stage('Test Docker') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'docker --version'
                    } else {
                        bat 'docker --version'
                    }
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Stop and remove any existing container named 'my-html-app'
                    sh 'docker stop my-html-app || true && docker rm my-html-app || true'
                    
                    // Run the container on port 9090
                    sh 'docker run -d --name my-html-app -p 9090:80 my-html-app'
                }
            }
        }
    }

    post {
        always {
            // Clean up the workspace after the build
            cleanWs()
        }
    }
}
