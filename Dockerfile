FROM ubuntu:trusty

RUN apt-get update && \
      apt-get install -y software-properties-common && \
      apt-add-repository ppa:ansible/ansible && \
      apt-get update && \
      apt-get install -y ansible

RUN apt-get install -y python-pip python-dev build-essential
RUN pip install --upgrade pip
RUN pip install --upgrade virtualenv
ENV ANSIBLE_HOST_KEY_CHECKING=False

RUN mkdir /root/.ssh
WORKDIR /ansible

ENTRYPOINT ./entrypoint.sh
