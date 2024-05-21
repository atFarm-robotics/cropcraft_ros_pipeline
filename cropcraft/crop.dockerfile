# Stage 1: Use an image with systemd
FROM ubuntu:22.04 AS systemd

# Install systemd
RUN apt update && apt install -y systemd && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Stage 2: Install Snap in an image with systemd
FROM systemd AS snapd

# Update package lists and install snapd
RUN apt update && apt install -y snapd && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Blender using Snap
#RUN snapd install blender --channel=4.0/stable --classic

# Copy the source code into the container
COPY src /app/src

# Set the working directory
WORKDIR /app/src

# Define the command to run your application
CMD ["python3", "cropcraft.py", "examples/test1.yaml"]

# FROM ubuntu:22.04

# # # Definir o usuário como root
# USER root

# # Copiar o código fonte para o diretório /app/src
# COPY src /app/src

# # Atualizar os pacotes e instalar o snapd e o Python 3
# RUN apt update && apt install -y snapd python3 python3-pip python3.10-venv

# # # Instalar o Blender usando o snap(aceitavel apenas 4.0 acima)
# RUN snapd install blender --channel=4.0/stable --classic

# # Definir o diretório de trabalho como /app/src
# WORKDIR app/src

# # # Criar o ambiente virtual e instalar as dependências Python
# # RUN python3 -m venv venv && \
# #     . venv/bin/activate && \
# #     venv/bin/pip install -r requirements.txt

# #Executar o script Python dentro do ambiente virtual
# CMD ["/bin/bash", "-c", ". ./venv/bin/activate && pip install -r requirements.txt && python3 cropcraft.py examples/test1.yaml"]

# ENTRYPOINT ["tail", "-f", "/dev/null"]



