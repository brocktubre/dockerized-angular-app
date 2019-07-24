FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install curl -y
RUN apt-get install rpm -y
RUN apt-get install gcc g++ make -y
RUN apt-get install ansible -y
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install nodejs
RUN mkdir -p /home/ansible/playbooks
RUN mkdir -p /tmp/site
COPY ./ansible.cfg ./hosts /home/ansible/
COPY ./playbooks /home/ansible/playbooks
COPY ./site /tmp/site
WORKDIR /home/ansible
RUN ansible-playbook /home/ansible/playbooks/setup-angular-app.yml
