# shell prompt based on environment type
if [ $ENV_TYPE = "prod" ]; then
    export PS1="\e[0;31m[\u@\h \e[0;34m[\W]\e[0;32m\$ \e[m "
else
    export PS1="\e[0;32m[\u@\h \e[0;34m[\W]\e[0;32m\$ \e[m "
fi
