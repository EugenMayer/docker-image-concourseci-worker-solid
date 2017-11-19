#!/bin/bash

set -e
# could be land-worker or retire worker
strategy=${1:-land-worker}
shift 1

function land_worker()
{
    echo "running $strategy to unregister worker"
    concourse ${strategy} --name `hostname`
}

# Allow any signal which would kill the worker
trap land_worker  KILL TERM

concourse worker $@ &

wait $!