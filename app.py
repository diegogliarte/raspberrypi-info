from fastapi import FastAPI
import platform
import psutil

app = FastAPI()

def get_system_info():
    return {
        "status": "running",  # Indicates that the Raspberry Pi is operational
        "system": platform.system(),
        "node": platform.node(),
        "release": platform.release(),
        "cpu_count": psutil.cpu_count(logical=False),
        "cpu_count_logical": psutil.cpu_count(logical=True),
        "memory_total": psutil.virtual_memory().total,
        "memory_available": psutil.virtual_memory().available
    }

@app.get("/info")
def read_info():
    return get_system_info()
