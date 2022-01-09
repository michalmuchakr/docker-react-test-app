pipeline {
    docker {
        image 'node:16.13.1-alpine'
    }

    stages {
        stage('build') {
            steps {
                sh('docker-compose build --no-cache builder')
            }
        }
        stage('test') {
            steps {
                sh('docker-compose build --no-cache tester')
            }
        }
    }
    post {
        always {
            echo 'One way or another, I have finished'
            deleteDir() /* clean up our workspace */
        }
        success {
            echo 'Build finish successfully!'
        }
        unstable {
            echo 'Build finish unstable!'
        }
        failure {
            echo 'Build failed sad-frog.jpg!'
        }
        changed {
            echo 'Things were different before...'
        }
    }
}
