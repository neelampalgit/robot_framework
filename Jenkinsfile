pipeline {
    agent any
    environment {
        ROBOT_REPORTS = 'robot_reports'  // Define output directory for reports
    }
    stages {
        stage('Prepare') {
            steps {
                // Check if the directory exists, if not create it
                script {
                    bat """
                    IF NOT EXIST ${ROBOT_REPORTS} mkdir ${ROBOT_REPORTS}
                    """
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
