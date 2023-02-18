FROM ubuntu:22.10

ARG USERNAME=dodgethis
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Environment flags used by the entrypoint script
ENV ENV_TYPE="dev"

# add repos
RUN apt update && apt install -y \
  curl \
  wget \
  software-properties-common
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
RUN wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee /etc/apt/sources.list.d/google-cloud-sdk.list
RUN echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com kinetic main" | tee /etc/apt/sources.list.d/hashicorp.list
RUN add-apt-repository ppa:neovim-ppa/unstable

# Install packages
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y \
  git \
  curl \
  wget \
  rsync \
  python3 \
  python3-pip \
  python3-virtualenv \
  golang \
  ruby \
  rubygems \
  openjdk-17-jdk-headless \
  postgresql-client \
  tmux \
  neovim \
  nodejs \
  npm \
  google-cloud-cli \
  google-cloud-cli-gke-gcloud-auth-plugin \
  kubectl \
  terraform \
  bash-completion \
  && rm -rf /var/lib/apt/lists/*

# Install npm packages for neovim
RUN npm install -g tree-sitter-cli

# Bash completion
RUN kubectl completion bash | tee /etc/bash_completion.d/kubectl > /dev/null

# Create user
RUN groupadd --gid $USER_GID $USERNAME \
  && useradd \
    --uid $USER_UID \
    --gid $USER_GID \
    -m $USERNAME

COPY entrypoint.sh /usr/bin/entrypoint.sh

# Configure user env
USER $USERNAME
COPY config/tmux/tmux.conf $HOME/$USERNAM/.tmux.conf
RUN mkdir -p /home/$USERNAME/.config/nvim
COPY config/nvim/ /home/$USERNAME/.config/nvim/
RUN mkdir /home/$USERNAME/.bashrc.d
COPY config/bash /home/$USERNAME/.bashrc.d/
RUN echo 'for file in ~/.bashrc.d/*.bashrc; do source "$file"; done' >> /home/$USERNAME/.bashrc
USER root
RUN chown -Rv $USERNAME /home/$USERNAME
USER $USERNAME

# Run default command
ENTRYPOINT ["/usr/bin/entrypoint.sh"]
CMD ["/bin/bash"]
