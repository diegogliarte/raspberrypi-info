#!/bin/bash

# Variables
APP_DIR=$(pwd)  # Use the current directory as the application directory
SERVICE_NAME="raspberrypi-info.service"
PYTHON_ENV_DIR="$APP_DIR/venv"
SERVICE_FILE_PATH="/etc/systemd/system/$SERVICE_NAME"

# Function to print messages
print_message() {
  echo "============================================"
  echo "$1"
  echo "============================================"
}

# 1. Create a Python virtual environment
print_message "Creating a Python virtual environment..."
python3 -m venv $PYTHON_ENV_DIR

# 2. Activate the virtual environment and install dependencies
print_message "Installing Python dependencies..."
$PYTHON_ENV_DIR/bin/pip install -r $APP_DIR/requirements.txt

# 3. Update the systemd service file with the correct paths
print_message "Updating the systemd service file with the correct paths..."
sed -i "s|WorkingDirectory=.*|WorkingDirectory=$APP_DIR|g" $APP_DIR/$SERVICE_NAME
sed -i "s|ExecStart=.*|ExecStart=$PYTHON_ENV_DIR/bin/python -m uvicorn main:app --host 0.0.0.0 --port 8000|g" $APP_DIR/$SERVICE_NAME

# 4. Copy the updated service file to the systemd directory
print_message "Configuring the systemd service..."
sudo cp $APP_DIR/$SERVICE_NAME $SERVICE_FILE_PATH

# 5. Reload systemd, enable, and start the service
print_message "Reloading systemd, enabling, and starting the service..."
sudo systemctl daemon-reload
sudo systemctl enable $SERVICE_NAME
sudo systemctl start $SERVICE_NAME

# 6. Check service status
print_message "Checking service status..."
sudo systemctl status $SERVICE_NAME

print_message "Setup completed successfully!"
