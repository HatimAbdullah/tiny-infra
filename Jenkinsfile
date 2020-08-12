pipeline {
  agent {
    dockerfile {
      filename 'Dockerfile'
      args '-u root'      
    }

  }
  stages {
    stage('Validate Environment') {
      steps {
        sh '''
ls
pwd
env
'''
      }
    }

   stage('prepare and plan') {
      steps {
          sh 'make init'
          sh 'time terraform plan -out plan.out'
      }
    }

    stage('Release') {
      steps {
        sh 'terraform apply plan.out'
      }
    }
   
    stage('publish ip') {
      steps {
        sh '''
	terraform output -json > machines-info
        cat > machines-info	
	'''
      }
    }


  }
  environment {
    CREDS = credentials('fish-creds')
    AWS_ACCESS_KEY_ID = "$CREDS_USR"
    AWS_SECRET_ACCESS_KEY = "$CREDS_PSW"
    OWNER = 'fish'
    PROJECT_NAME = 'to-mars' 
  }
}

