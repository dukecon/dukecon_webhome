@Library('jenkins-library@master') _

pipeline {
    agent {
        node {
            label 'docker'
        }
    }

    options {
        disableConcurrentBuilds()
        buildDiscarder(logRotator(numToKeepStr: '5', daysToKeepStr: '5'))
    }

    triggers {
        pollSCM('*/3 * * * *')
    }

    stages {
        stage('Generate static pages') {
            steps {
                sh("./gradlew clean bake")
            }
        }
        stage('Publish static pages') {
            steps {
                publishHTML(target: [allowMissing         : true,
                                     alwaysLinkToLastBuild: false,
                                     keepAll              : true,
                                     reportDir            : 'build/docs/html5/site/',
                                     reportFiles          : 'index.html',
                                     reportName           : 'Web Site'])
            }
        }
    }
    post {
        always {
            sendNotification currentBuild.result
        }
        failure {
            // notify users when the Pipeline fails
            mail to: 'gerd@aschemann.net',
                    subject: "Failed DukeCon WebHome Pipeline: ${currentBuild.fullDisplayName}",
                    body: "Something is wrong with ${env.BUILD_URL}"
        }
    }
}
