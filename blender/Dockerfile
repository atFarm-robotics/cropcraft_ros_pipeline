# Use a imagem base do Blender
FROM lscr.io/linuxserver/blender:latest

# Defina variáveis de ambiente
ENV PATH=$PATH:/snap/bin

# Instale dependências do sistema(Deve-se manter a versão python>=3.7 e python<3.8)
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y python3-pip python3-venv cpulimit && \
    rm -rf /var/lib/apt/lists/*

# Download, Install and Set 3.7.17 configurations Python 3.7

# RUN apt-get update && \
#     apt-get upgrade -y && \
#     apt-get install -y python3-pip python3-venv cpulimit && \
#     rm -rf /var/lib/apt/lists/*
#     apt-get install wget build-essential checkinstall &&\
#     apt-get install libcurses-dev libssl-dev && \
#     libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev 

# RUN cd /usr/src && \
#     wget https://www.python.org/ftp/python/3.7.17/Python-3.7.17.tgz && \
#     tar xzf Python-3.7.17.tgz && \
#     cd Python-3.7.17 && \
#     ./configure --enable-optimizations && \
#     make altinstall

RUN apt-get install -y python3-pip python3-venv cpulimit && \
    rm -rf /var/lib/apt/lists/*

# Copie o código-fonte
COPY cropcraft/src /cropcraft/src

# Defina o diretório de trabalho
WORKDIR /cropcraft/src

# Crie e ative um ambiente virtual, e instale as dependências Python
# RUN python3 -m venv venv && \
#     . venv/bin/activate && \
#     python -m pip install --upgrade pip && \
#     pip install -r requirements.txt

# Código para manter o contêiner em execução
ENTRYPOINT ["tail", "-f", "/dev/null"]