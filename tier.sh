#!/bin/bash
# ------------------------------------------------------------------
# [Author] Daniel Sont
#          Runs Scripts to control vagrant with coreos and docker
# ------------------------------------------------------------------

TIERDIR=/usr/lib/tier
SCRIPTSDIR=${TIERDIR}/scripts
DIR=$(pwd)

USAGE="Usage: tier [init|add|push|rm|run]"

# --- Option processing --------------------------------------------
if [ $# == 0 ] ; then
    echo $USAGE
    exit 1;
fi

subcommand=$1

shift;

case $subcommand in
  "init")
    ${SCRIPTSDIR}/init.sh "$@"
    exit $?;
    ;;
  "up")
    ${SCRIPTSDIR}/up.sh "$@"
    exit $?;
    ;;
  "exec")
    $SCRIPTSDIR/core_exec.sh "$@"
    exit $?;
    ;;
  "ssh")
    $SCRIPTSDIR/ssh.sh "$@"
    exit $?;
    ;;
  "add")
    ${SCRIPTSDIR}/add_image.sh "$@"
    exit $?;
    ;;
  "push")
    ${SCRIPTSDIR}/push_image.sh "$@"
    exit $?;
    ;;
  "rm")
    $SCRIPTSDIR/rm_image.sh "$@"
    exit $?;
    ;;
  "run")
    $SCRIPTSDIR/run_image.sh "$@"
    exit $?;
    ;;
  "container")
    $SCRIPTSDIR/container.sh "$@"
    exit $?;
    ;;
esac