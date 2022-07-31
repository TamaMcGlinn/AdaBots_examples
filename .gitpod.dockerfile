FROM gitpod/workspace-full

# Note: duplicated from ave Dockerfile:
# https://www.github.com/TamaMcGlinn/ave
RUN sudo apt-get update \
 && sudo apt-get install -y \
    git wget unzip \
 && sudo rm -rf /var/lib/apt/lists/*

RUN mkdir ~/tools
WORKDIR ~/tools

# Install alire
RUN wget https://github.com/alire-project/alire/releases/download/v1.2.0/alr-1.2.0-x86_64.AppImage -O ~/tools/alr
RUN chmod +x ~/tools/alr
RUN echo "#!/bin/bash\n~/tools/alr --appimage-extract-and-run \$@" > /usr/bin/alr
RUN chmod +x /usr/bin/alr
RUN alr toolchain --select gnat_native
RUN alr toolchain --select gprbuild

# Install ada_language_server
# RUN mkdir -p /root/.local/bin/
RUN wget https://open-vsx.org/api/AdaCore/ada/22.0.8/file/AdaCore.ada-22.0.8.vsix -O als.zip
RUN mkdir ada_language_server
RUN unzip als.zip -d ada_language_server
RUN rm als.zip
RUN chmod +x ada_language_server/extension/linux/ada_language_server 
RUN ln -s "ada_language_server/extension/linux/ada_language_server" /usr/bin/ada_language_server
