# RaspberryPI Info

This repository contains a simple FastAPI application that provides system information about the Raspberry Pi it is hosted on. The application can be set up as a systemd service to run directly on the Raspberry Pi.

## Requirements

- Raspberry Pi running a Linux-based OS (e.g., Raspbian)
- Python 3 installed on the Raspberry Pi
- `pip` (Python package installer) installed on the Raspberry Pi
- `systemd` (already available on most Linux distributions)

## Setup

1. **Clone the repository**:

   ```
   git clone https://github.com/diegogliarte/raspberrypi-info.git
   cd raspberrypi-info
   ```

2. **Install Python dependencies**:

   Install the necessary Python packages from `requirements.txt`:

   ```
   pip3 install -r requirements.txt
   ```

## Running the Application as a Systemd Service

1. **Move the service file to the systemd directory**:

   Ensure the `.service` file from the repository is copied to the correct directory:

   ```
   sudo cp raspberrypi-info.service /etc/systemd/system/
   ```

2. **Enable and Start the Service**:

   After moving the service file, reload the systemd daemon, enable the service, and start it:

   ```
   sudo systemctl daemon-reload
   sudo systemctl enable raspberrypi-info.service
   sudo systemctl start raspberrypi-info.service
   ```

3. **Verify the Service**:

   Check if the service is running correctly:

   ```
   sudo systemctl status raspberrypi-info.service
   ```

## Stopping the Application

To stop the FastAPI service, use:

```
sudo systemctl stop raspberrypi-info.service
```

To disable the service from starting at boot, use:

```
sudo systemctl disable raspberrypi-info.service
```

## Usage

Once the application is running as a service, you can access the FastAPI endpoint to retrieve system information:

- Open your web browser and navigate to: `http://localhost:8081/info`

This will return a JSON object with system information such as CPU count, memory usage, and temperature.
