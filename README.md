# build-simple-go

## Background

This is a simple Go application that provides an API to return a response of "Hello, world!" when accessed. The service runs on port 8080, and all paths with any HTTP method will return the response as "Hello, world! [timestamp]". This application also includes the ability to build and deploy to a Kubernetes engine, running with Minikube, for local development and testing.

## How to Start a Server

You can run the following command to start the server:

```bash
go run .
```
This will start the server locally, and you can access the API at http://localhost:8080/.

Build the Application with Container
To build the application as a container image, you can use the provided Makefile:

```bash
make build-local
```
This command will build a container image of the application. You can then use tools like Docker or Kubernetes to deploy the containerized application as needed.

Please make sure you have the necessary dependencies installed and properly configured for building and deploying containerized applications.

## Dependencies
Before running or building this application, make sure you have the following dependencies installed:

* Go (Golang)
* Docker (for containerization)
* Minikube (for local Kubernetes testing)

## Contributing
Feel free to contribute to this project by opening issues or submitting pull requests. We welcome contributions and improvements to make this simple Go application even better!