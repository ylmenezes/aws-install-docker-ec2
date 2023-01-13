#!/bin/bash

apt-get update -y
apt-get install ca-certificates curl gnupg lsb-release -y
curl -fsSL https://get.docker.com | bash
