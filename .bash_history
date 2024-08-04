#Setting up the private docker registry and sonarqube 
docker run -d -p 5000:5000 --name privreg registry:2 #Running the docker registry
docker network ls #Checks which networks are in place
docker run -d --name sonar-postgres --network sonarnet -e POSTGRES_USER=sonar -e POSTGRES_PASSWORD=sonar -e POSTGRES_DB=sonar postgres:latest #Creates and runs a sonar-progres container that is connected to the sonarnet network so that it can communicate with sonarqube
docker run -d --name sonarqube --network sonarnet -p 9000:9000 -e SONAR_JDBC_URL=jdbc:postgresql://sonar-postgres/sonar -e SONAR_JDBC_USERNAME=sonar -e SONAR_JDBC_PASSWORD=sonar sonarqube:latest #Creates and runs a sonarqube container that communicates with the sonar-postgres container on the sonernet network
#Creating and Pushing Legitimate images by creating a dockerfile and requirements file. Then build, tag and push the image to the localhost.
nano Dockerfile
nano Requirements.txt
docker build -t pic1:secure . #Building the image
docker tag pic1:secure localhost:5000/pic1:secure #Tagging the picture to the private registry 
docker push localhost:5000/pic1:secure #Pushing the image to the private registry
#Previous command did not execute due to container not running in dockerhub
docker push localhost:5000/pic1:secure #Pushing the image to the private registry
#Simulating the attack by creating and pushing malicious images by building a malicious dockerfile then building tagging and pushing the malicious image into the private registry
nano Dockerfile.malicious
nano Dockerfile.malicious
docker build -t pic2:malicious -f Dockerfile.malicious .
docker tag pic2:malicious localhost:5000/pic1:secure 
docker push localhost:5000/pic1:secure
mkdir .github
cd "C:/Users/Dzang/OneDrive/Documentos/CyberSafe Foundation - Cybersecurity/Soft Skills; Week 4 to 8 - Group Project/monitoring-containerized-apps" #Going back to root folder (repository) in order to set up the 'sonar-project.properties' file that has configuration settings that Sonarqube uses to analyze the project 
nano sonar-project.properties
cd "C:/Users/Dzang/OneDrive/Documentos/CyberSafe Foundation - Cybersecurity/Soft Skills; Week 4 to 8 - Group Project/monitoring-containerized-apps"
nano sonar-project.properties
#Adding a few more configurations to the sonar-project.properties file, above
