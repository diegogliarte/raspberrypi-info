from fastapi import FastAPI
import platform
import psutil
import subprocess

app = FastAPI()

def get_cpu_temperature():
    try:
        temp_output = subprocess.check_output(["vcgencmd", "measure_temp"]).decode()
        temp = float(temp_output.split('=')[1].split("'")[0])
        return temp
    except Exception as e:
        return None

def get_system_info():
    return {
        "status": "running",
        "system": platform.system(),
        "node": platform.node(),
        "release": platform.release(),
        "cpu_count": psutil.cpu_count(logical=False),
        "cpu_count_logical": psutil.cpu_count(logical=True),
        "cpu_usage": psutil.cpu_percent(interval=0),
        "cpu_usage_per_core": psutil.cpu_percent(interval=0, percpu=True),
        "memory_total": psutil.virtual_memory().total,
        "memory_available": psutil.virtual_memory().available,
        "temperature": get_cpu_temperature(),
    }

@app.get("/info")
def read_info():
    return get_system_info()
