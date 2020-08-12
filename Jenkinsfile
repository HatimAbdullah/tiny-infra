pipeline {
  agent {
    docker {
      image "bryandollery/terraform-packer-aws-alpine"
      args "-u root --entrypoint='' --rm"
    }
  }
  stages {
    stage('Validate Environment') {
      steps {
        sh """
find . -type d -exec chmod a+rwx {} \\;
find . -type f -exec chmod a+rw {} \\;
chmod -R a+rwx .terraform
ls
pwd
env
"""
      }
    }

   stage('prepare and plan') {
      steps {
          sh 'make init'
          sh 'time terraform plan -out plan.out -lock=false'
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
        ls -a	
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

