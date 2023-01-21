node {
	def dockerCredentials = "Docker"
	def app
	stage('Clone') 
	{
		checkout scm
	}

	stage('Build') 
	{
		app = docker.build("19120179/devops_demo")
	}

	stage("test"){
		app.inside {
            sh "npm --prefix ./project/ run test"
            sh "echo 'running addional test'"
            sh "echo 'passed'"
		}
	}

	stage('Push') 
	{
		docker.withRegistry("https://registry.hub.docker.com", "${dockerCredentials}")
		{
			app.push("${env.BUILD_ID}") 
			app.push("latest")
		}
	}

	stage('Deploy')
	{
		try 
		{
			sh "docker kill devops_demo"
		}
		catch (exe){}
		finally 
		{
			app.run("--rm --name devops_demo -p 8081:3000")
		}
	}

}