pipeline {
    agent {
        label 'gradle'
    }

    tools {
        jfrog 'jfrog-cli'
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

        stage('Verify JFrog Connection') {
            steps {
                jf '-v'
                jf 'c show'
                jf 'rt ping --server-id=artifactory-local'
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