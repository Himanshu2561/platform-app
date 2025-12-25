# --- Stage 1: Builder ---
FROM python:3.12-slim AS builder

# Install uv binary from official image
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Environment for building
ENV UV_COMPILE_BYTECODE=1
WORKDIR /app

# Copy dependency files
COPY pyproject.toml uv.lock ./

# Install dependencies into a virtual environment
# We use --no-cache to avoid bloating the builder layer unnecessarily
RUN uv sync --frozen --no-cache --no-dev

# --- Stage 2: Final Production Stage ---
FROM python:3.12-slim

# Non-privileged user setup remains for security
RUN groupadd -r appuser && useradd -r -g appuser -s /sbin/nologin appuser

WORKDIR /app

# Copy ONLY the virtual environment and source code from the builder stage
COPY --from=builder /app/.venv /app/.venv
COPY main.py .

# Update PATH to use the venv binaries directly
ENV PATH="/app/.venv/bin:$PATH"

# Ensure the appuser owns the application files
RUN chown -R appuser:appuser /app

# Switch to the non-root user
USER appuser

# Document the port
EXPOSE 8000

# Start the application using the venv's uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
