node {
    
    stage("Pulling project from Github") {
            
        git(credentialsId: 'Git Creds', url: 'https://github.com/visualsofDhruv/DevOps-Training-Project', branch: 'main')

    }
    
    stage("Build Docker Image") {
        
        sh 'docker build -t gowebapp:latest .'
        sh 'docker tag gowebapp visualsofdhruv/gowebapp:latest'
        sh 'docker tag gowebapp visualsofdhruv/gowebapp:$BUILD_NUMBER'
        
    }
    
    stage("Pushing Docker image to docker container") {

        withDockerRegistry([ credentialsId: "dockerhub", url: "" ]) {
            
            sh 'docker push visualsofdhruv/gowebapp:latest'
            sh 'docker push visualsofdhruv/gowebapp:$BUILD_NUMBER'
        }

    }

}