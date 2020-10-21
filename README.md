## Cloud Native - Tema Final 01

## Yan Haeffner - JT Engenharia de Dados


# REQUISITES:

   ## 1) Java 8:
   
	a) Install Java 8 (https://docs.datastax.com/en/jdk-install/doc/jdk-install/installOpenJdkDeb.html)
	
	b) Check Java version in your terminal with: java -version


   ## 2) Docker:
   
	a) Install Docker (https://docs.docker.com/get-docker/)
	
	b) Check Docker version in your terminal with: docker --version
	

   ## 3) Packer:
   
	a) Install Packer (https://www.packer.io/docs/install)
	
	b) Check Packer version in your terminal with: packer --version
	

   ## 4) Ports:
   
	The whole application (including JFrog and Jenkins) uses ports 8080,
		8081, 8082 and 8282. Make sure to have all these ports available


   ## 5) Docker Hub account and a public repository:
   
	a) Create your Docker Hub account (https://hub.docker.com)
	
	b) Create your public repository for congratulationsApp, ex:
		congratulations_app



# INSTALLATION:

   ## 1) JFrog Artifactory:
   
	a) Execute "buildAndRunJFrog.sh": it will check, create if not
		present and run a JFrog docker container with 8081 8082 exposed
		ports.
		
	b) After starting JFrog Artifactory container, it will be available at
		http://localhost:8081/artifactory	
		
	c) Open JFrog on your browser and create your user credentials
	
	d) On JFrog Quick Setup (right corner under Welcome, $user) select your
		new Gradle Repository to create it.
		
	c) To stop JFrog enter anything on the same terminal and it will stop
		the docker image		


   ## 2) Jenkins:
   
	a) Execute "buildAndRunJenkins.sh": it will download and set both Tomcat
		and Jenkins files to the "congratulationsApp" folder. After this
		step it will attempt to start the downloaded Tomcat with Jenkins
		already on the webapps folder.
		
	b) After starting Tomcat please enter the following sh on your terminal:
		cat /var/jenkins_home/secrets/initialAdminPassword
		and it will print your Jenkins admin password. In your browser:
		http://localhost:8080/jenkins to access your Jenkins app.
		
	c) Create a new Jenkins Username and Password for future use and install
		all recommended plugins.
		
	d) To stop Jenkins enter anything on the same terminal and it will stop
		your Tomcat application.



# CONFIGURATION:

   ## 1) Jenkins:
   
	a) Go to "Manage Jenkins" on your Jenkins App and click on "Manage
		Plugins", then on Available Tab and use the filter text input to
		search for "Artifactory" plugin and select it.
		Click on "Install without restart" and wait.
	
	b.1) Go back to "Manage Jenkins" and click on "Configure System", scroll
		down to JFrog section and click on "Add Artifactory Server".
	
	b.2) On "Server ID" type: jfrog-artifactory-server
	
	b.3) On "URL" type: http://localhost:8081/artifactory
	
	b.4) On "Deployer Credentials" enter your JFrog user and password that
		you've created on INSTALLATION-1-c step of this guide
	
	b.5) Click on "Test Connection" to check if JFrog is reachable and you
		should see "Found Artifactory x.x.x" if everything is fine. If
		you see an error message, repeat the whole process carefully.
	
	b.6) Click on "Save" and head back to "Manage Jenkins" section.
	
	c.1) Click on "Manage Credentials" and then click on "(global)" domain
	
	c.2) Add a Username with Password credential with the following set:
		ID: artifactory-credentials
		Username: <your_artifactory_username>
		Password: <your_artifactory_password>
		Description: JFrog Artifactory Credentials
	
	c.3) Add a Secret Text Credential with the following set:
		ID: artifactory-url
		Secret: http://localhost:8081/artifactory
		Description: JFrog Artifactory Server URL

	c.4) Add a Username With Password credential with the following set:
		ID: dockerhub-credentials
		Username: <your_dockerhub_username>
		Password: <your_dockerhub_password>
		Description: Docker Hub Credentials

	c.5) Add a Secret Text Credential with the following set:
		ID: dockerhub-repository
		Secret: <your_public_dockerhub_repository>
			ex: username/congratulations_app
		Description: Docker Hub Repository



# PIPELINES:

   ## 1) Build App:
   
	a) Create a new Jenkins item named "build_app" and select "Pipeline"
	
	b) On "Pipeline" set "Definition" to "Pipeline script" and paste the
		Jenkinsfile script located at "build_app" folder of this project
	
	c) Save it

   ## 2) Infra App:
	
	a) Create a new Jenkins item named "infra_app" and select "Pipeline"
	
	b) On "Pipeline" set "Definition" to "Pipeline script" and paste the
		Jenkinsfile script located at "build_app" folder of this project
	
	c) Save it

   ## 3) Run App:
	
	a) Create a new Jenkins item named "run_app" and select "Pipeline"
	
	b) On "Pipeline" set "Definition" to "Pipeline script" and paste the
		Jenkinsfile script located at "build_app" folder of this project
	
	c) Save it

   ## 4) Video: 
   
   	a) a video explaining every pipeline described here can be found at:
	https://youtu.be/0OdUMO1r7Fw [PT-BR]



# BUILDING PROCESS:

   ## 1) Open your "build_app" Jenkins item page:
	
	http://localhost:8080/jenkins/job/build_app/ and click on "Build Now"
	
	a) You should see a "Success" message if everything is fine.
	
	b) If something other than (a) happens, repeat all the steps carefully

   ## 2) Open your "infra_app" Jenkins item page:
	
	http://localhost:8080/jenkins/job/infra_app/ and click on "Build Now"
	
	a) You should see a "Success" message if everything is fine.
	
	b) If something other than (a) happens, repeat all the steps carefully
	
	c) Notice that this process pulls and builds a docker image with Ubuntu
		and a few other tools, so it may take up to 30 min to complete.

   ## 3) Open your "run_app" Jenkins item page:
	
	http://localhost:8080/jenkins/job/run_app/ and click on "Build Now"
	
	a) You should see a "Success" message if everything is fine.
	
	b) If something other than (a) happens, repeat all the steps carefully



# USING THE APP:

   a) The congratulationsApp will be available at:
   
	http://localhost:8282/congratulations/{your_name}

   b) To use it, enter the previous link in your browser and change {your_name}
	to your name

   c) Congratulations!
