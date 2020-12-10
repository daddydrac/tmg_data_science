FROM ubuntu:18.04

MAINTAINER joehoeller@gmail.com

ARG PYTHON=python3
ARG PIP=pip3
ENV LANG C.UTF-8

# Core Linux Deps
RUN apt-get update && apt-get install -y --fix-missing --no-install-recommends apt-utils \
    build-essential \
    curl \
    pkg-config \
    python-numpy \
    python-dev \
    python-setuptools \
    software-properties-common \
    wget \
    vim \
    qt5-default \
    unzip \
    zip \ 
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

RUN apt-get update && apt-get install -y \
    ${PYTHON} \
    ${PYTHON}-pip

RUN pip --no-cache-dir install --upgrade \
    pip \
    setuptools \
    hdf5storage \
    h5py \
    py3nvml \
    scikit-learn \
    matplotlib \
    pyinstrument \
    jupyter-tabnine \
    mlflow \
    seldon-core \
    mpmath \
    shap \
    tensor-sensor \
    wandb \
    dask-optuna \
    optuna \
    jupyter-bokeh \
    bokeh \
    yellowbrick \
    hiplot-mlflow \
    mlflow-extend \
    seldon-deploy-sdk \
    jupyterlab \
    sympy

RUN conda update -n base -c defaults conda
RUN conda update --all
RUN conda update sympy
RUN conda install -c anaconda jupyter 
RUN conda update conda
RUN conda install -c anaconda ipykernel 
RUN conda install -c anaconda seaborn 
RUN conda install -c anaconda ipython
RUN conda install dask
RUN conda install ipykernel


WORKDIR /projects
EXPOSE 8888 

# Better container security versus running as root
RUN useradd -ms /bin/bash container_user
ENV PATH="$HOME/.local/bin:$PATH"

CMD ["bash", "-c", "source /etc/bash.bashrc && jupyter lab --notebook-dir=/projects --ip 0.0.0.0 --no-browser --allow-root --config=/usr/local/etc/jupyter/jupyter_notebook_config.py --NotebookApp.custom_display_url='http://localhost:8888'"]
