#!/usr/bin/env bash

function land_worker()
{
    echo "Landing worker"
    concourse land-worker --name `hostname`
}

# Allow any signal which would kill the worker
trap land_worker  KILL TERM

worker &

wait $!