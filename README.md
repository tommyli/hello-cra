# Hello CRA

Sample application bootstrapped using Create React App, containerized using Docker and deployment instructions
to Google Cloud Platform Kubernetes Engine.

## Getting Started

### Prerequisites

* GCP configured.
* Docker already configured and logged in to Docker Hub

## Build Container and Publish to Docker Hub and Deploy to GKE

```bash
docker-compose build

docker push tommyyli/hello-cra:latest

kubectl apply -f hello-cra.yml
```

## Administration and Troubleshooting

### Administering Docker Locally

[Docker Cheat Sheet](https://www.digitalocean.com/community/tutorials/how-to-remove-docker-images-containers-and-volumes)

Running docker containers.

```bash
# Run container
docker run -p 5000:5000 --name hello-cra tommyyli/hello-cra

# Run container as daemon
docker run -p 5000:5000 --name hello-cra -d tommyyli/hello-cra

# OR using docker-compose
docker-compose up -d
```

View running and stopped docker containers.

```bash
# View currently running
docker ps

# View all, currently running or stopped
docker ps -a
```

Building docker images

```bash
# Using docker
docker build --tag tommyyli/hello-cra:latest .

# OR

# Using docker-compose
docker-compose build
```

View docker images

```bash
# List docker images
docker images

# Remove docker image by name
docker rmi tommyyli/hello-cra

# Remove docker images by `IMAGE ID`
docker rmi 2af76a5b9374 34eb3a8a848c
```

### Adminstering Kubernetes Locally

Get all pods (smallest deployment unit in GCP Kubernetes, essentially, it's a group of 1 or more containers) running.

```bash
kubectl get pods
```

Get all services running.

```bash
kubectl get service
```

Access application using `EXTERNAL-IP` from the results of `kubectl get service` (hello-cra-service) command above.

The `gcloud container clusters create` command above automatically updates your Kubernetes config file (default location is ~/.kube/config)
with credentials and context set to this cluster.  If for any reason the context is switched, to switch back then run this:

```bash
gcloud container clusters get-credentials hello-cra
```

Create Kubernetes cluster:

```bash
gcloud container clusters create hello-cra --num-nodes=1
```

Using kubectl commands instead of `kubectl apply -f hello-cra.yml`

```bash
# Create deployment
kubectl create deployment hello-cradeployment --image=registry.hub.docker.com/tommyyli/hello-cra

# Create service
kubectl expose deployment hello-cra-deployment --type LoadBalancer --port 80 --target-port 5000
```

### Cleanup

```bash
kubectl delete service hello-cra-service

kubectl delete deployment hello-cra-deployment

gcloud container clusters delete hello-cra
```

## Original README from Create React App

This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

## Available Scripts

In the project directory, you can run:

### `yarn start`

Runs the app in the development mode.<br />
Open [http://localhost:3000](http://localhost:3000) to view it in the browser.

The page will reload if you make edits.<br />
You will also see any lint errors in the console.

### `yarn test`

Launches the test runner in the interactive watch mode.<br />
See the section about [running tests](https://facebook.github.io/create-react-app/docs/running-tests) for more information.

### `yarn build`

Builds the app for production to the `build` folder.<br />
It correctly bundles React in production mode and optimizes the build for the best performance.

The build is minified and the filenames include the hashes.<br />
Your app is ready to be deployed!

See the section about [deployment](https://facebook.github.io/create-react-app/docs/deployment) for more information.

### `yarn eject`

**Note: this is a one-way operation. Once you `eject`, you can’t go back!**

If you aren’t satisfied with the build tool and configuration choices, you can `eject` at any time. This command will remove the single build dependency from your project.

Instead, it will copy all the configuration files and the transitive dependencies (webpack, Babel, ESLint, etc) right into your project so you have full control over them. All of the commands except `eject` will still work, but they will point to the copied scripts so you can tweak them. At this point you’re on your own.

You don’t have to ever use `eject`. The curated feature set is suitable for small and middle deployments, and you shouldn’t feel obligated to use this feature. However we understand that this tool wouldn’t be useful if you couldn’t customize it when you are ready for it.

## Learn More

You can learn more in the [Create React App documentation](https://facebook.github.io/create-react-app/docs/getting-started).

To learn React, check out the [React documentation](https://reactjs.org/).

### Code Splitting

This section has moved here: <https://facebook.github.io/create-react-app/docs/code-splitting>

### Analyzing the Bundle Size

This section has moved here: <https://facebook.github.io/create-react-app/docs/analyzing-the-bundle-size>

### Making a Progressive Web App

This section has moved here: <https://facebook.github.io/create-react-app/docs/making-a-progressive-web-app>

### Advanced Configuration

This section has moved here: <https://facebook.github.io/create-react-app/docs/advanced-configuration>

### Deployment

This section has moved here: <https://facebook.github.io/create-react-app/docs/deployment>

### `yarn build` fails to minify

This section has moved here: <<https://facebook.github.io/create-react-app/docs/troubleshooting#npm-run-build-fails>
