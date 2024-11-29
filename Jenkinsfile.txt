pipeline {
    agent any
    environment {
        ROBOT_REPORTS = 'reports'
    }
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/neelampalgit/robot_framework.git'
            }
        }
        stage('Install Dependencies') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }
        stage('Run Robot Tests') {
            steps {
                sh '''
                    mkdir -p ${ROBOT_REPORTS}
                    robot --outputdir ${ROBOT_REPORTS} tests/
                '''
            }
        }
        stage('Publish Reports') {
            steps {
                publishHTML target: [
                    reportDir: "${ROBOT_REPORTS}",
                    reportFiles: 'report.html',
                    reportName: 'Robot Framework Report'
                ]
            }
        }
    }
}
