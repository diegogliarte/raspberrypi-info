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

2. **Run the setup script**:

   The repository contains a `setup.sh` script that automates the setup process. Run the script with `sudo` to install dependencies, set up the virtual environment, and configure the systemd service:

   ```
   sudo ./setup.sh
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

- Open your web browser and navigate to: `http://<your_raspberry_pi_ip>:8000/info`

This will return a JSON object with system information such as CPU count, memory usage, and temperature.

## Notes

- Ensure that the `setup.sh` script is executable. If it isn't, run:

  ```
  chmod +x setup.sh
  ```

- The script will set up a virtual environment in the current directory (`./venv`) and install all dependencies listed in `requirements.txt`.
- The systemd service file is copied to `/etc/systemd/system/` to manage the FastAPI application.

