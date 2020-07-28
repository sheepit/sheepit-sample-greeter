# Sheep It - Sample Greeter

This is a minimalistic Node.js app to test Sheep It deployments. The only thing that app does is responding to `GET /` with a configurable name.


## Running the app

Running the app locally:

``` bash
npm start
curl http://localhost:8080
# Hello, stranger! My name is Gallus Anonymus.
```

Configuring the name:

``` bash
GREETER_NAME="Local John" npm start
curl http://localhost:8080
# Hello, stranger! My name is Local John.
```


## Working with TreeScale

We recommend using private Docker Registry for testing, e.g. [TreeScale](https://treescale.com/).

Sing up at [TreeScale](https://treescale.com/). Remember your username.

We need to create a secret in Kuibernetes for registry authentication.

Log in to TreeScale:

``` bash
docker login repo.treescale.com
```

This should update your credentials, which usually are at:

``` bash
cat ~/.docker/config.json
```

Upload your local credentials to Kubernetes. Update the location of your credentials file if necessary.  Mind, that in this example environments are represented by Kubernetes namespaces; in other words, you'll need to do that for a number of namespaces, e.g. `dev`, `test` and `prod`.

``` bash
kubectl create secret generic regcred \
    --from-file=.dockerconfigjson=$(realpath ~/.docker/config.json) \
    --type=kubernetes.io/dockerconfigjson \
    --namespace=dev
```

The `$(realpath ~/.docker/config.json)` is due to the `~` [expanding error that sometimes occurs](https://github.com/kubernetes/kubectl/issues/276).

For more information on storing Registry credentials in Kubernetes, see the [offical Kubernetes documentation](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/).


## Building the app

Building a Docker image:

``` bash
docker build -t repo.treescale.com/<your username>/sheepit-sample-greeter:0.0.1 .
```

Running the image locally:

``` bash
docker run -p 8081:8080 -d -e GREETER_NAME="Containerized John" repo.treescale.com/<your username>/sheepit-sample-greeter:0.0.1
curl http://localhost:8081
# Hello, stranger! My name is Containerized John.
```

Publishing the image:

``` bash
docker login
docker push repo.treescale.com/<your username>/sheepit-sample-greeter:0.0.1
```