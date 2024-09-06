# Use a imagem base do Blender
FROM lscr.io/linuxserver/blender:latest

# Defina variáveis de ambiente
ENV PATH=$PATH:/snap/bin

# Instale dependências do sistema
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y python3-pip python3-venv cpulimit && \
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