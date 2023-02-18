# Docker image for Neovim and Tmux

## Tools

Currently installing
- neovim
- tmux
- google cloud CLI (including kubectl)

## Build

Build the `Dockerfile` in the current directory and tag the image as 'local-devops-ide'.
```
docker -t local-devops-ide .
```

## Run

Run the image labelled as 'local-devops-ide', in interactive mode (-i), allocating a pseudo-TTY (-t), automatically remove the container on exit (--rm), making the present working directory available in the container under /data.
```
docker run -it --rm --volume="$(pwd)":/data local-devops-ide
```

*NOTE:* When you first run `nvim` it will trigger the setup of the plugins. So you might have to open it and exit a couple of times before it's fully setup.

## Credits

### Neovim

Setup based off:
- https://www.youtube.com/watch?v=vdn_pKJUda8
- https://github.com/josean-dev/dev-environment-files

Shout out to Josean Martinez :)
