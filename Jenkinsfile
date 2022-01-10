pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                script{
                    try {
                        sh 'docker-compose build --no-cache builder'
                    } catch(e) {
                        throw e
                    }
                }
            }
        }
        stage('test') {
            steps {
                script{
                    try {
                        sh 'docker-compose build --no-cache tester'
                    } catch(e) {
                        throw e
                    }
                }
            }
        }
    }
    post {
        success {
            mailSender('Build finish successfully!')
        }
        unstable {
            mailSender('Build finish unstable!')
        }
        failure {
            mailSender('Build failed sad-frog.jpg!')
        }
        changed {
            echo 'Things were different before...'
        }
    }
}

def mailSender(String buildSatus) {
    def subject = "${buildStatus}: of build [${env.BUILD_NUMBER}]'"
    def summary = "Link to build: (${env.BUILD_URL})"
    
    emailext (
        mimeType: 'text/html',
        subject: subject,
        to: 'michal.mucha.kr@gmail.com'
    )
}
