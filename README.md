# DevOps Zero to Hero

## [Watch YouTube Video Here](https://www.youtube.com/watch?v=Yk_wAh57_YU)

<img src=imgs/zero-to-hero-cover.png>

## Python Flask Application

DevOps_Zero_To_Hero repository! This project is designed to guide you through the journey of mastering DevOps practices, starting from a simple Python Flask application and progressively moving through various stages. The project begins with running the application locally, then to Docker, Docker Compose, Kubernetes, and then to the cloud.

## Prerequisites

- Python 3.9 or higher
- pip (Python package installer)
- Docker

## Running the Application Locally

1. Clone the repository files to your local machine.
2. Navigate to the project directory.
3. Install the required Python packages using `pip`:

   ```sh
   pip3 install -r requirements.txt
   ```

4. Run the Flask application:

   ```sh
   python3 app.py
   ```

5. Open your web browser and go to `http://127.0.0.1:5000`. You should see "Hello, Docker with Python!".

## Running the Application with Docker

### Building the Docker Image

1. Make sure you have Docker installed on your machine.
2. Navigate to the project directory where the `Dockerfile` is located.
3. Build the Docker image using the following command:

   ```sh
   docker build -t zero-to-hero-img .
   ```

### Running the Docker Container

You can run the Docker container using the built image. There are two options for port mapping:

1. **Default Port (5000:5000)**

   ```sh
   docker run -d --name zero-to-hero-container -p 5000:5000 zero-to-hero-img
   ```

2. **Custom Port (e.g., 8083:5000)**

   ```sh
   docker run -d --name zero-to-hero-container -p 8083:5000 zero-to-hero-img
   ```

### Accessing the Application

- If you used the default port mapping (`5000:5000`), open your web browser and go to `http://127.0.0.1:5000`.
- If you used a custom port mapping (e.g., `8083:5000`), open your web browser and go to `http://127.0.0.1:8083`.

You should see "Hello, Docker with Python!".

### Stopping and Removing the Container

To stop the running container, use:

```sh
docker stop zero-to-hero-container
```

To remove the container, use:

```sh
docker rm zero-to-hero-container
```

To remove the docker image, use:

```sh
docker rmi zero-to-hero-img
```

## Automating Docker Container with Ansible

To further streamline the process of building and running the Docker container, you can use the following Ansible playbook `playbook.yml`. This playbook automates stopping and removing any existing containers and images, building a new Docker image, tagging and pushing it to Docker Hub, and finally running the container.

### Running the Playbook

1. Ensure you have Ansible installed on your machine.
2. Save the above playbook to a file named `playbook.yml`.
3. Run the playbook using the following command:

   ```sh
   ansible-playbook playbook.yml
   ```

This playbook simplifies the process of managing your Docker container by automating the repetitive tasks, allowing you to focus on development and deployment.

## Automating Docker Container Management with Shell Scripts

In addition to using Ansible, you can also automate the process of managing your Docker container using shell scripts. Below are two scripts: one for cleaning up existing Docker containers and images, and another for rebuilding and running the Docker container.

### Shell Scripts

#### `cleanup.sh`

The `cleanup.sh` script stops and removes any existing Docker containers and images, delete namespace and stop minikube.

#### `build.sh`

The `build.sh` script stops and removes any existing Docker containers and images, builds a new Docker image from the Dockerfile, push the docker image to Docker Registry, start minikube, create namespace and deploy the application.

### Running the Scripts

Make sure the scripts are executable by running the following commands:

```sh
chmod +x cleanup.sh
chmod +x build.sh
```

3. Run the cleanup script to remove any existing containers and images:

   ```sh
   ./cleanup.sh
   ```

4. Run the rebuild script to build the Docker image and run the container:

   ```sh
   ./build.sh
   ```

These scripts provide a straightforward and efficient way to manage your Docker containers and images, ensuring that you can quickly clean up and rebuild your application environment as needed.

---

## Deploying the Application on Minikube Using Kubernetes

In this section, we will deploy the `DevOps Zero to Hero` application on Minikube using Kubernetes manifest files located in the `k8s` directory. The deployment will consist of a Kubernetes Deployment and a Service that exposes the application.

### Prerequisites

- Minikube installed on your machine.
- kubectl configured to interact with your Minikube cluster.

### Steps to Deploy

1. **Start Minikube**

   First, start Minikube if it isn't already running:

   ```sh
   minikube start
   ```

2. **Navigate to the Kubernetes Manifests Directory**

   Change your directory to the `k8s` folder where the Kubernetes manifests (`deployment.yml` and `service.yml`) are stored.

   ```sh
   cd k8s
   ```

3. **Create a Namespace**

   It's a good practice to deploy your resources into a specific namespace. Create a namespace named `zero-to-hero`:

   ```sh
   kubectl create namespace zero-to-hero
   ```

4. **Deploy the Application**

   Apply the deployment manifest to create the Deployment:

   ```sh
   kubectl apply -f deployment.yml -n zero-to-hero
   ```

   This command will deploy two replicas of the `zero-to-hero` application using the Docker image `triple3a/zero-to-hero:latest`.

5. **Expose the Application with a Service**

   Next, apply the service manifest to create a Service that exposes the application on a NodePort:

   ```sh
   kubectl apply -f service.yml -n zero-to-hero
   ```

   The service will expose the application on a NodePort, allowing you to access it through Minikube's IP address.

6. **Access the Application**

   To access the application, first, retrieve the URL using the following command:

   ```sh
   minikube service zero-to-hero-service -n zero-to-hero --url
   ```

   The command will output a URL that you can open in your web browser. This URL will direct you to the `zero-to-hero` application running inside the Minikube cluster.

### Managing the Deployment with k9s

`k9s` is a powerful terminal-based UI to manage your Kubernetes clusters. It simplifies the management of resources within your cluster, including deployments, services, and more.

#### Accessing Your Cluster with k9s

1. **Start k9s**

   Launch `k9s` by simply typing the following command in your terminal:

   ```sh
   k9s
   ```

2. **Switch to the `zero-to-hero` Namespace**

   By default, `k9s` shows resources in the `default` namespace. To switch to the `zero-to-hero` namespace, type:

   ```sh
   :zero-to-hero
   ```

   This will filter the view to only show resources within the `zero-to-hero` namespace.

#### Scaling the Deployment

To scale your `zero-to-hero` deployment:

1. Navigate to the `Deployments` view by selecting `Deployments` from the `k9s` menu or by typing `deploy` in the command bar.
2. Select the `zero-to-hero-deployment` by navigating to it using the arrow keys.
3. Press `S` to scale the deployment. You will be prompted to enter the desired number of replicas.
4. Enter the new replica count and press `Enter`.

#### Updating the Deployment

If you need to update the Docker image used by your deployment:

1. Select the `zero-to-hero-deployment` in the `Deployments` view.
2. Press `E` to edit the deployment manifest directly in `k9s`.
3. Navigate to the `spec` section and update the `image` field to the new Docker image version.
4. Save and exit the editor. `k9s` will automatically apply the changes to your cluster.

#### Deleting the Deployment and Service

To delete the `zero-to-hero` deployment and service:

1. Navigate to the `Deployments` view and select `zero-to-hero-deployment`.
2. Press `D` to delete the deployment.
3. Confirm the deletion when prompted.

   Repeat the process for the `Services` view to delete the `zero-to-hero-service`.

   Alternatively, you can delete all resources in the `zero-to-hero` namespace by selecting the namespace in `k9s` and pressing `ctrl+d`.
