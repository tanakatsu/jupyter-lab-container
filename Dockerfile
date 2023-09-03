FROM nvidia/cuda:11.1.1-devel-ubuntu20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    libreadline-dev \
    libssl-dev \
    zlib1g \
    zlib1g-dev \
    libbz2-dev \
    libsqlite3-dev \
    liblzma-dev \
    libffi-dev \
    curl \
    git \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean

ARG UID=1000
RUN useradd -m -u ${UID} jupyter
USER jupyter

ENV HOME /home/jupyter
RUN git clone https://github.com/yyuu/pyenv.git $HOME/.pyenv
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH
RUN pyenv --version && pyenv install 3.8.6 && pyenv global 3.8.6 && python --version
RUN pyenv rehash

COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

ARG password="password"
RUN mkdir $HOME/.jupyter
COPY jupyter_lab_config.py $HOME/.jupyter/
ENV PASSWORD $password

WORKDIR /workspace
