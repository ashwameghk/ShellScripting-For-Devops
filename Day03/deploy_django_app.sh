#!/bin/bash

<<task 
Deploy a Django app
and handle the code for errors
task

code_clone() {
    echo "Cloning the Django app..."
    if [ -d "django-notes-app" ]; then
        echo "The code directory already exists."
        cd django-notes-app || exit 1
    else
        git clone https://github.com/LondheShubham153/django-notes-app.git && cd django-notes-app || exit 1
    fi
}

install_requirement() {
    echo "Installing dependencies..."
    sudo apt-get update
    sudo apt-get install docker.io nginx -y || { echo "Installation failed"; exit 1; }
}

required_restarts() {
    echo "Configuring system services..."
    sudo chown "$USER" /var/run/docker.sock
    sudo systemctl enable docker || { echo "Failed to enable Docker"; exit 1; }
    sudo systemctl enable nginx || { echo "Failed to enable Nginx"; exit 1; }
    sudo systemctl restart docker || { echo "Docker restart failed"; exit 1; }
}

deploy() {
    echo "Building and deploying the application..."
    docker build -t notes-app . || { echo "Docker build failed"; exit 1; }
    docker run -d -p 8000:8000 --name notes-app notes-app:latest || { echo "Docker run failed"; exit 1; }
}

echo "********** DEPLOYMENT STARTED **********"

code_clone

install_requirement

required_restarts

deploy

echo "********** DEPLOYMENT DONE **********"

