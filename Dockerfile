FROM ubuntu:18.04
CMD [ "echo", "hello-world" ]

# Python
RUN apt-get update -qq && \
    apt-get install -qqy --no-install-recommends \
        python3-pip \
        python3-setuptools \
        python3-dev \
        gcc \
# Need sudo for installing k8s
        sudo && \
    ln -sf /usr/bin/pip3 /usr/local/bin/pip && \
    ln -sf /usr/bin/python3 /usr/local/bin/python && \
    pip install wheel && \
    pip install --upgrade setuptools && \
    # Cleanup
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean -y && \
    rm -rf /root/.cache/pip

# K8s 
RUN sudo apt-get update && sudo apt-get install -y apt-transport-https gnupg2 curl && \
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - && \
    echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list && \
    sudo apt-get update && \
    sudo apt-get install -y kubectl

# AWS CLI
RUN sudo apt-get update && sudo apt-get install -y unzip glibc-source groff less &&\
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" &&\
    unzip awscliv2.zip &&\
    sudo ./aws/install

# Clean up aws download
RUN rm -rf ./aws/ && \
    rm -rf ./awscliv2.zip
# ENTRYPOINT [ "/bin/bash" ]