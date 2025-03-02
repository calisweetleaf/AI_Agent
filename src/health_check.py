import psutil
import torch
import logging

def check_system_health():
    checks = {
        "memory": psutil.virtual_memory().percent < 90,
        "cpu": psutil.cpu_percent() < 80,
        "gpu": torch.cuda.memory_allocated() < 0.9 * torch.cuda.get_device_properties(0).total_memory,
        "disk": psutil.disk_usage('/').percent < 90
    }
    return all(checks.values())