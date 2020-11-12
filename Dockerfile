FROM ubuntu:18.04
CMD [ "echo", "hello-world" ]

# Python
RUN apt-get update -qq && \
    apt-get install -qqy --no-install-recommends \
        python3-pip \
        python3-setuptools \
        python3-dev \
        gcc && \
    ln -sf /usr/bin/pip3 /usr/local/bin/pip && \
    ln -sf /usr/bin/python3 /usr/local/bin/python && \
    pip install wheel && \
    pip install --upgrade setuptools && \
    # Cleanup
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean -y && \
    rm -rf /root/.cache/pip

# ENTRYPOINT [ "/bin/bash" ]