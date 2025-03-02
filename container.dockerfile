# Base image with Python and CUDA support
FROM nvidia/cuda:12.3.1-runtime-ubuntu22.04

# System dependencies
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
    wget \
    curl \
    apparmor \
    seccomp \
    && rm -rf /var/lib/apt/lists/*

# Security hardening
RUN apt-get update && apt-get install -y \
    apparmor \
    seccomp \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /ai_agent

# Copy requirements first for caching
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# Install Hermes model dependencies
RUN pip3 install --no-cache-dir \
    transformers \
    torch \
    accelerate \
    safetensors

# Copy project files
COPY src/ ./src/
COPY scripts/ ./scripts/
COPY config/ ./config/
COPY setup_guide.md .

# Add security profiles
COPY security/apparmor.profile /etc/apparmor.d/
COPY security/seccomp.json /etc/seccomp/

# Create directories
RUN mkdir -p /ai_agent/models /ai_agent/logs /ai_agent/data

# Environment variables
ENV PYTHONPATH=/ai_agent
ENV MODEL_PATH=/ai_agent/models
ENV CUDA_VISIBLE_DEVICES=0
ENV LOG_LEVEL=INFO

# Security configurations
RUN useradd -m -s /bin/bash ai_user
RUN chown -R ai_user:ai_user /ai_agent
USER ai_user

# Model download at build time (optional)
RUN python3 src/download_model.py

# Health check
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD python3 -c "from src.core_sys_security import SecurityMetrics; SecurityMetrics().check_system_health()"

# Entry point
ENTRYPOINT ["python3", "src/orchestrator.py"]

# Default command (can be overridden)
CMD ["--config", "config/default.yaml"]