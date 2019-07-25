# Dockerized Angular Application

This application is a simple example of how to use Docker + Angular + Ansible. This simple application uses Docker to containerize an Angular app and uses ANsible to load and configure the build/distribution of the Angular application.

1. Build Docker Image
To build the Docker image use the following: docker build image -t ubuntu-angular

2. Run the docker container
Run the docker contianer: docker run ubuntu-angular

3. Run app locally
Run the angular app: ng serve

4. Docker Installs
Docker installs the ubuntu container and things like apache, ansible, and nodejs.

5. Ansible Configurations
Ansible removes the node_modules, runs npm install, packages the Angular app, and deploys it to /var/www/html directory.

6. Apache Serves App
Apache serves the application.
