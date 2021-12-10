#!/bin/sh
## Cette commande est utilisée pour désactiver tweak dans whm;;

whmapi1 set_tweaksetting key=smtpmailgidonly value=0

# top command permet d'analyser les processus en cours avec le taux de memoire utilisé
#top/atop/htop/glances 

# ces actions permettent de debloquer smpt_block ou activer
nano /etc/csf/csf.conf
SMTP_BLOCK="0"
csf -r

## CL. Disable ptrace for users kernel.user_ptrace = 0 kernel.user_ptrace_self = 0##
#nano /etc/sysctl.conf pour y accéder
kernel.user_ptrace=0
kernel.user_ptrace_self=0

#pour appliquer les modifs
sysctl -p