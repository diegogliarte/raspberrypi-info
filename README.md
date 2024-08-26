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

2. **Create a Python virtual environment**:

   It's a good practice to use a virtual environment to manage dependencies. Create and activate a virtual environment in the project directory:

   ```
   python3 -m venv venv
   source venv/bin/activate
   ```

3. **Install Python dependencies**:

   With the virtual environment activated, install the necessary Python packages from `requirements.txt`:

   ```
   pip install -r requirements.txt
   ```

## Running the Application as a Systemd Service

1. **Modify the service file to use the virtual environment**:

   Ensure the `.service` file references the virtual environment's Python executable. Open the `raspberrypi-info.service` file and modify it to point to the correct `ExecStart` path:

   ```
   [Unit]
   Description=Raspberry Pi Info Service
   After=network.target

   [Service]
   WorkingDirectory=/path/to/raspberrypi-info
   ExecStart=/path/to/raspberrypi-info/venv/bin/python -m uvicorn main:app --host 0.0.0.0 --port 8000
   Restart=always

   [Install]
   WantedBy=multi-user.target
   ```

   Make sure to replace `/path/to/raspberrypi-info` with the actual path to your project directory.

2. **Move the service file to the systemd directory**:

   Copy the modified `.service` file to the systemd directory:

   ```
   sudo cp raspberrypi-info.service /etc/systemd/system/
   ```

3. **Enable and Start the Service**:

   After moving the service file, reload the systemd daemon, enable the service, and start it:

   ```
   sudo systemctl daemon-reload
   sudo systemctl enable raspberrypi-info.service
   sudo systemctl start raspberrypi-info.service
   ```

4. **Verify the Service**:

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

