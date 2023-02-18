#!/bin/bash

set -u
set -e

# setup kubectl context

# setup shell prompt based on environment type
if [ $ENV_TYPE = "prod" ]; then
  export PS1="\e[0;31m[\u@\h \W]\$ \e[m "
else
  export PS1="\e[0;32m[\u@\h \W]\$ \e[m "
fi

exec "$@"
