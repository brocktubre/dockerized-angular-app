FROM ubuntu:19.04
RUN apt-get update -y && apt-get install software-properties-common -y && apt-add-repository ppa:ansible/ansible && apt-get update -y && apt-get install -y \
ansible \
curl \
rpm \
gcc \
g++ \
make

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && apt-get install nodejs

RUN mkdir -p /home/ansible/playbooks
RUN mkdir -p /tmp/site

COPY ./ansible/ansible.cfg ./ansible/hosts /home/ansible/
COPY ./ansible/playbooks /home/ansible/playbooks
COPY ./site /tmp/site
WORKDIR /home/ansible
RUN ansible-playbook /home/ansible/playbooks/setup-angular-app.yml

EXPOSE 80
CMD ["/etc/init.d/nginx", "start"]

