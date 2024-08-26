# RaspberryPI Info

This repository contains a simple FastAPI application that provides system information about the Raspberry Pi it is hosted on. The application is containerized using Docker and can be easily deployed using Docker Compose.

## Requirements

- Docker installed on the Raspberry Pi
- Docker Compose installed on the Raspberry Pi

## Setup

1. **Clone the repository**:

   ```bash
   git https://github.com/diegogliarte/raspberrypi-info.git
   cd raspberrypi-info
   ```

## Running the Application

To build and run the FastAPI application, use Docker Compose:

```bash
docker compose up -d
```

This command will build the Docker image and start the container in detached mode.

## Stopping the Application

To stop and remove the FastAPI container, use:

```bash
docker compose down
```

## Usage

Once the application is running, you can access the FastAPI endpoint to retrieve system information:

- Open your web browser and navigate to: `http://localhost:8081/info`

This will return a JSON object with system information such as CPU count, memory usage, and disk space.
