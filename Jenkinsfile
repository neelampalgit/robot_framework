pipeline {
    agent any
    environment {
        ROBOT_REPORTS = 'robot_reports'  // Define output directory for reports
    }
    stages {
        stage('Prepare') {
            steps {
                // Create the directory to store the Robot Framework reports (Windows-compatible)
                script {
                    bat "mkdir ${ROBOT_REPORTS}"
                }
            }
        }

        stage('Run Tests') {
            steps {
                // Run Robot Framework tests from the root directory
                script {
                    bat """
                    robot --outputdir ${ROBOT_REPORTS} *.robot
                    """
                }
            }
        }

        stage('Publish Reports') {
            steps {
                // Publish the Robot Framework results
                publishRobotResults path: "${ROBOT_REPORTS}"
            }
        }
    }
}
