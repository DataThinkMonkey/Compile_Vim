# FedoraGeekNoteVim
Script to compile Vim 8.0 with python2 support and install Geeknote on Fedora 26. 

The script does the following:

1. Checks for git install.
2. Installs dependencies for Vim 8.0.
3. Clones Vim 8.0 repo.
4. Configures, make and make installs.
5. Clones my personal .vimrc file and .vim directory.
6. Install dependencies for Geeknotes. 
7. Installs python modules.
8. Clone Geeknote.
9. Installed Geeknote.

**To-do**

1. Error checking and resolution.
2. Include other installs and configures for a fresh Fedora install.
   (Virtualbox, docker, insync, chrome, etc)
