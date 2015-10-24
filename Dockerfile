FROM ubuntu:trusty

ENV DEBIAN_FRONTEND=noninteractive

RUN \
    # Ensure we are up to date
    apt-get update -y && \
    apt-get upgrade -y && \

    # Install openssh server
    apt-get install openssh-server -y && \

    # Required to not get a 'Missing privilege separation directory' error
    mkdir /var/run/sshd && \

    # Create /root/.ssh folder to be able to add the pub key to the authorized_keys file
    mkdir -p /root/.ssh

ADD id_rsa.pub /root/.ssh/authorized_keys
    

EXPOSE 22

CMD /usr/sbin/sshd -D
