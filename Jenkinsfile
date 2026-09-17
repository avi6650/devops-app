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
                withCredentials([
                    usernamePassword(
                        credentialsId: 'artifactory-local-credentials',
                        usernameVariable: 'ARTIFACTORY_USER',
                        passwordVariable: 'ARTIFACTORY_PASSWORD'
                    )
                ]) {
                    withEnv([
                        'INTERNAL_REPO_URL=http://localhost:8082/artifactory/devops-maven-virtual'
                    ]) {
                        sh './gradlew clean build'
                    }
                }
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