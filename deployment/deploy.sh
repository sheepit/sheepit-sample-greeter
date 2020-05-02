#!/bin/bash

cat namespace.yaml \
| sed "s/{{GREETER_K8S_NAMESPACE}}/$GREETER_K8S_NAMESPACE/g" \
| kubectl apply -f -

cat kubernetes.yaml \
| sed "s/{{GREETER_NAME}}/$GREETER_NAME/g" \
| sed "s/{{GREETER_PORT}}/$GREETER_PORT/g" \
| kubectl apply --namespace=$GREETER_K8S_NAMESPACE -f -