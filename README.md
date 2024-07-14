# DevOps Zero to Hero

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
