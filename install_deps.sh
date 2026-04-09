#!/bin/bash

########################################
# Install repo
########################################
mkdir -p ~/Tools/repo
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/Tools/repo/repo
chmod a+x ~/Tools/repo/repo
# Add to PATH only if not already present in .bashrc
if ! grep -Fxq "export PATH=\$HOME/Tools/repo:\$PATH" ~/.bashrc; then
	echo 'export PATH=$HOME/Tools/repo:$PATH' >> ~/.bashrc
fi
source ~/.bashrc



