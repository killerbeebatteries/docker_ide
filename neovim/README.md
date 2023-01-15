# Docker image for Neovim and Tmux

## Build
docker -t local-nvim-ide .

## Run

```
docker run -it --rm local-nvim-ide
```

## TODO
* Update the docker run command to support directory bindings, so we can interact with files on the host filesystem.
