# Docker image for Neovim and Tmux

## Build

Build the `Dockerfile` in the current directory and tag the image as 'local-nvim-ide'.
```
docker -t local-nvim-ide .
```

## Run

Run the image labelled as 'local-nvim-ide', in interactive mode (-i), allocating a pseudo-TTY (-t), automatically remove the container on exit (--rm), making the present working directory available in the container under /data.
```
docker run -it --rm --volume="$(pwd)":/data local-nvim-ide
```
