FROM ubuntu:14.04
MAINTAINER mwas
RUN apt-get -y update
RUN apt-get install -y python-yaml python-jinja2 git
RUN git config --global user.name "mwaside"
RUN git config --global user.email "francismwangi152@gmail.com"
RUN apt-get -y install software-properties-common
RUN add-apt-repository -y ppa:rquillo/ansible
RUN apt-get update
RUN apt-get -y install ansible
ADD inventory /etc/ansible/hosts
ADD requirements.txt .
RUN git clone  https://github.com/mwaaas/Wezatele-docker-builder.git /tmp/devops
WORKDIR /tmp/devops
RUN git pull origin master
RUN ansible-playbook configure.yml -c local
EXPOSE 22 3000
ENTRYPOINT [“/usr/bin/foo”]


