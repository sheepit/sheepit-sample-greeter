# Sheep It - Sample Greeter

This is a minimalistic Node.js app to test Sheep It deployments. The only thing that app does is responding to `GET /` with a configurable name.

Image is available on [Docker Hub](https://hub.docker.com/r/sheepit/sheepit-sample-greeter).

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

Building a Docker image:

``` bash
docker build -t <your username>/sheepit-sample-greeter:0.0.1 .
```

Running the image locally:

``` bash
docker run -p 8081:8080 -d -e GREETER_NAME="Containerized John" <your username>/sheepit-sample-greeter:0.0.1
curl http://localhost:8081
# Hello, stranger! My name is Containerized John.
```

Publishing the image:

``` bash
docker login
docker push <your username>/sheepit-sample-greeter:0.0.1
```