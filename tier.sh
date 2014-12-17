#!/bin/bash
# ------------------------------------------------------------------
# [Author] Daniel Sont
#          Runs Scripts to control vagrant with coreos and docker
# ------------------------------------------------------------------

TIERDIR=/usr/lib/tier
SCRIPTSDIR=${TIERDIR}/scripts

function upsearch () {
    test / == "$PWD" && return
    test -e "$1" && echo "$PWD" && return
    cd .. && upsearch "$1"
}

project_dir=$(upsearch .tier)

usage () {
  echo "Usage: tier <command> [-v] [options]"
  echo -e "\t init \n\t\t initialize tier in directory"
  echo -e "\t up \n\t\t start vm instance"
  echo -e "\t down \n\t\t halt vm instance"
  echo -e "\t destroy \n\t\t destroy vm, project or project contents"
  echo -e "\t exec \n\t\t run a command on vm instance"
  echo -e "\t ssh [container] \n\t\t ssh to instance or a running container"
  echo -e "\t add \n\t\t add a docker image"
  echo -e "\t push <image-name> \n\t\t copy a docker image from host os into instance"
  echo -e "\t run <id|name> \n\t\t start a container of <image> inside instance"
  echo -e "\t rm <id|all> \n\t\t stop and remove"
  echo -e "\t container <start|stop> <name|id> \n\t\t start and stop existing containers in instance"
}

# --- Option processing --------------------------------------------
if [ $# == 0 ] ; then
    usage;
    exit 1;
fi

subcommand=$1

shift;

case $subcommand in
  "init")
    tier_cmd="${SCRIPTSDIR}/init.sh $@" ;;
  "up")
    tier_cmd="${SCRIPTSDIR}/up.sh $@" ;;
  "down")
    tier_cmd="${SCRIPTSDIR}/down.sh $@" ;;
  "destroy")
    tier_cmd="${SCRIPTSDIR}/destroy.sh $@" ;;
  "exec")
    tier_cmd="$SCRIPTSDIR/core_exec.sh $@" ;;
  "ssh")
    tier_cmd="$SCRIPTSDIR/ssh.sh $@" ;;
  "add")
    tier_cmd="${SCRIPTSDIR}/add_image.sh $@" ;;
  "push")
    tier_cmd="${SCRIPTSDIR}/push_image.sh $@" ;;
  "rm")
    tier_cmd="$SCRIPTSDIR/rm_image.sh $@" ;;
  "run")
    tier_cmd="$SCRIPTSDIR/run_image.sh $@" ;;
  "container")
    tier_cmd="$SCRIPTSDIR/container.sh $@" ;;
esac
echo $tier_cmd;
cd $project_dir && $tier_cmd
exit $?;
