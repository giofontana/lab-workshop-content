#!/bin/bash

# We want to bail if an error occurs.
set -e
user=$1

cd $(dirname $0)


image=$(oc get deployments -n openshift-image-registry image-registry --template '{{ range $x := .spec.template.spec.containers }} {{- $x.image -}} {{ end }}')

# deploy the DC definition into the projects
oc process -f netproj-template.yaml NAMESPACE=netproj-a-${user} IMAGE="$image" | oc apply -n netproj-a-${user} -f -
oc process -f netproj-template.yaml NAMESPACE=netproj-b-${user} IMAGE="$image" | oc apply -n netproj-b-${user} -f -
