@Library('jenkins-library@master') _

properties(
    [
        buildDiscarder(
            logRotator(
                daysToKeepStr: '5',
                numToKeepStr: '5'
            )
        ),
	disableConcurrentBuilds()
    ]
)

// Every jenkins file should start with either a Declarative or Scripted Pipeline entry point.
node {
    //Utilizing a try block so as to make the code cleaner and send slack notification in case of any error
    try {
        // Global variable declaration
        def project = 'dukecon_webhome'
        
        // Stage, is to tell the Jenkins that this is the new process/step that needs to be executed
        stage('Checkout') {
            // Pull the code from the repo
            checkout scm
        }

        stage('Generate static pages') {
            sh("./gradlew clean bake")
        }       

    } catch (e) {
        currentBuild.result = "FAILED"
        throw e
    } finally {
        sendNotification currentBuild.result
    }
}