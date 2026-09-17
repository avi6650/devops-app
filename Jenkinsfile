pipeline {
    agent {
        label 'gradle'
    }

    options {
        timeout(time: 15, unit: 'MINUTES')
        disableConcurrentBuilds()
    }

    stages {
        stage('Build') {
            steps {
                sh './gradlew clean build'
            }
        }
    }

    post {
        success {
            echo 'Build successful'
        }

        failure {
            echo 'Build failed'
        }
    }
}