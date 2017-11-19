#!/usr/bin/env bash

# could be land-worker or retire worker
strategy=${1:-land-worker}
shift 1
function land_worker()
{
    echo "Landing worker"
    concourse land-worker --name `hostname`
}

# Allow any signal which would kill the worker
trap land_worker  KILL TERM

worker $@ &

wait $!