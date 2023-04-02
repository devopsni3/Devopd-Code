FROM jenkins/jenkins:lts 

MAINTAINER Nitin.Mandloi 

USER root 

  

# Install the latest Docker CE binaries 

RUN apt-get update && \ 

    apt-get -y install apt-transport-https \ 

      ca-certificates \ 

      curl \ 

      gnupg2 \ 

      software-properties-common && \ 

    curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \ 

    add-apt-repository \ 

      "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \ 

      $(lsb_release -cs) \ 

      stable" && \ 

   apt-get update && \ 

   apt-get -y install docker-ce 

  

RUN apt update && \ 

      apt install -y curl && \ 

      curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && \ 

      chmod +x ./kubectl && \ 

      mv ./kubectl /usr/local/bin/kubectl 
