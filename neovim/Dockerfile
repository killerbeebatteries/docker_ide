FROM ubuntu:22.10

ARG USERNAME=dodgethis
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Install packages
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y \
  git \
  python3 \
  python3-pip \
  tmux \
  neovim \
  && rm -rf /var/lib/apt/lists/*

# Create user
RUN groupadd --gid $USER_GID $USERNAME \
  && useradd \
    --uid $USER_UID \
    --gid $USER_GID \
    -m $USERNAME

# Configure user env
USER $USERNAME
COPY config/tmux/tmux.conf $HOME/$USERNAM/.tmux.conf
RUN mkdir -p /home/$USERNAME/.config/nvim
COPY config/nvim/ /home/$USERNAME/.config/nvim/
USER root
RUN chown -Rv $USERNAME /home/$USERNAME
USER $USERNAME

# Run default command
CMD ["/bin/bash"]
