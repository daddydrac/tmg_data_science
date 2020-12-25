FROM nvidia/cuda:11.1-base-ubuntu20.04

MAINTAINER joehoeller@gmail.com

ARG PYTHON=python3
ARG PIP=pip3
ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND noninteractive

# Core Linux Deps
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y --fix-missing --no-install-recommends apt-utils \
    build-essential \
    python-setuptools \
    software-properties-common \
    wget \
    vim \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*  && \
    apt-get clean && rm -rf /tmp/* /var/tmp/*

# Fix conda errors per Anaconda team until they can fix
RUN mkdir ~/.conda

# Install Miniconda 
RUN wget --quiet https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
/bin/bash Miniconda3-latest-Linux-x86_64.sh -f -b -p /opt/conda && \
rm Miniconda3-latest-Linux-x86_64.sh
ENV PATH /opt/conda/bin:$PATH


WORKDIR /projects
EXPOSE 8888 

# Better container security versus running as root
RUN useradd -ms /bin/bash container_user
ENV PATH="$HOME/.local/bin:$PATH"

CMD ["bash", "-c", "source /etc/bash.bashrc && jupyter lab --notebook-dir=/projects --ip 0.0.0.0 --no-browser --allow-root --config=/usr/local/etc/jupyter/jupyter_notebook_config.py --NotebookApp.custom_display_url='http://localhost:8888'"]
