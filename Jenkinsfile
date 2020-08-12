pipeline {
  agent {
    docker {
      image "bryandollery/terraform-packer-aws-alpine"
      args "-u root --entrypoint=''"
    }
  }
  stages {
    stage('Validate Environment') {
      steps {
        sh """
ls
pwd
env
"""
      }
    }

   stage('prepare and plan') {
      steps {
          sh 'make init'
          sh 'chmod -R a+rwx .terraform ssh'
          sh 'time terraform plan -out plan.out -lock=false'
      }
    }

    stage('Release') {
      steps {
        sh 'terraform apply -lock=false plan.out'
      }
    }
   
    stage('publish ip') {
      steps {
        sh '''
	terraform output -json > machines-info
        cat machines-info
        cat ssh/id_rsa
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

