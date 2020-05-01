#!/bin/bash

cat kubernetes.yaml \
| sed "s/{{GREETER_NAME}}/$GREETER_NAME/g" \
| sed "s/{{GREETER_PORT}}/$GREETER_PORT/g" \
| kubectl apply -f -