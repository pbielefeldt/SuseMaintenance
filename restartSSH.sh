#!/bin/env bash

# Use this script if your git client does
# try to log onto gitlab with user name
# git@..., because ssh doesn't work.

# start the ssh-agent in the background and load its environment variables
eval "$(ssh-agent -s)"

# add the keys (again)

# add the private key for git at AG Thoma to the ssh-agent
ssh-add $HOME/.ssh/id_p_bielefeldt

# add the private key for fsketzer git
ssh-add $HOME/.ssh/id_rsa.3

#ssh-add $HOME/.ssh/id_rsa
#ssh-add $HOME/.ssh/id_rsa.1
#ssh-add $HOME/.ssh/id_rsa.2

echo -e "restarted ssh"
