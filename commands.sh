#!/bin/bash

#Install Bitnami Sealed secrets
# Make sure to install the bitnami sealed secrets controller to kube-system namespace
kubectl apply -f bitnami-sealed-controller/controller.yaml -n kube-system

#Install kubeseal
brew install kubeseal #macOS


kubeseal -n sealed-secret-application < unsealed_secrets/db-creds.yml > ../manifests/db-creds-encrypted.yaml -o yaml
kubeseal -n sealed-secret-application  < unsealed_secrets/paypal-cert.yml > ../manifests/paypal-cert-encrypted.yaml -o yaml