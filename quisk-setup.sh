#!/bin/sh
set -o errexit

docker run -d --restart=always -p "127.0.0.1:5000:5000" --name "kind-registry" registry:2
curl https://raw.githubusercontent.com/manuelcoppotelli/kind-cluster-setup/main/cluster.yaml | kind create cluster --config -
docker network connect kind kind-registry
kubectl apply --filename tools/local-registry-hosting.yaml
