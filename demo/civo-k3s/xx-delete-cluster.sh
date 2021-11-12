#!/bin/sh
set -x -e
civo kubernetes delete merlin-cluster --yes
civo firewall delete merlin-cluster --yes