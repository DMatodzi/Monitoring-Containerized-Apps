#Setting up the private docker registry and sonarqube 
docker run -d -p 5000:5000 --name privreg registry:2 #Running the docker registry
docker network ls #Checks which networks are in place
docker run -d --name sonar-postgres --network sonarnet -e POSTGRES_USER=sonar -e POSTGRES_PASSWORD=sonar -e POSTGRES_DB=sonar postgres:latest #Creates and runs a sonar-progres container that is connected to the sonarnet network so that it can communicate with sonarqube
docker run -d --name sonarqube --network sonarnet -p 9000:9000 -e SONAR_JDBC_URL=jdbc:postgresql://sonar-postgres/sonar -e SONAR_JDBC_USERNAME=sonar -e SONAR_JDBC_PASSWORD=sonar sonarqube:latest #Creates and runs a sonarqube container that communicates with the sonar-postgres container on the sonernet network
