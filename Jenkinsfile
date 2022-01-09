pipeline {
    agent any

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
            emailext body: 'A Test EMail',
            recipientProviders: [
                [
                    $class: 'DevelopersRecipientProvider'
                ],
            [
                $class: 'RequesterRecipientProvider'
                ]
            ],
            subject: 'Test'
        }
    }
}
