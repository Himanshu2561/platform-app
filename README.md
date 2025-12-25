# 🚀 Platform App

[![Python](https://img.shields.io/badge/Python-3.12-blue.svg)](https://www.python.org/)
[![FastAPI](https://img.shields.io/badge/FastAPI-0.127.0-009688.svg)](https://fastapi.tiangolo.com/)
[![Docker](https://img.shields.io/badge/Docker-Enabled-2496ED.svg)](https://www.docker.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A production-ready FastAPI boilerplate designed for learning DevOps deployments, containerization, and modern Python development workflows.

---

## 🌟 Features

- **FastAPI Core**: High-performance asynchronous API framework.
- **UV Powered**: Blazing fast dependency management and virtual environments using `uv`.
- **Dockerized**: Multi-stage Docker builds optimized for security and size.
- **Security First**:
  - Runs as a non-privileged user in production.
  - Multi-stage builds to minimize image surface area.
  - Secure dependency management with `uv.lock`.
- **Health Checks**: Built-in `/health` endpoint for monitoring and orchestration (K8s/Docker).

---

## 🛠 Tech Stack

- **Lanuage:** [Python 3.12](https://www.python.org/)
- **API Framework:** [FastAPI](https://fastapi.tiangolo.com/)
- **Server:** [Uvicorn](https://www.uvicorn.org/)
- **Package Manager:** [uv](https://github.com/astral-sh/uv)
- **Containerization:** [Docker](https://www.docker.com/)

---

## 🚀 Getting Started

### Prerequisites

- [Python 3.12+](https://www.python.org/downloads/)
- [uv](https://github.com/astral-sh/uv) (Highly recommended for dependency management)

### Local Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/yourusername/platform-app.git
   cd platform-app
   ```

2. **Set up the virtual environment:**

   ```bash
   uv sync
   ```

3. **Activate the environment:**
   ```bash
   # On macOS/Linux
   source .venv/bin/activate
   # On Windows
   .venv\Scripts\activate
   ```

### Running Locally

Start the development server with:

```bash
uvicorn main:app --reload
```

The application will be available at `http://localhost:8000`.

---

## 🐳 Docker Deployment

This project includes a production-grade Dockerfile featuring multi-stage builds and security hardening.

### Build the Image

```bash
docker build -t platform-app:latest .
```

### Run the Container

```bash
docker run -p 8000:8000 platform-app:latest
```

---

## 🔌 API Documentation

Once the app is running, you can access the interactive API docs:

- **Swagger UI**: [http://localhost:8000/docs](http://localhost:8000/docs)
- **Redoc**: [http://localhost:8000/redoc](http://localhost:8000/redoc)

### Endpoints

| Method | Endpoint  | Description                     |
| ------ | --------- | ------------------------------- |
| `GET`  | `/health` | Check application health status |

---

## 📁 Project Structure

```text
.
├── .github/          # CI/CD workflows (optional)
├── main.py           # Application entry point
├── pyproject.toml    # Project metadata and dependencies
├── uv.lock           # Deterministic dependency lock file
├── Dockerfile        # Production Docker configuration
└── README.md         # This file!
```

---

## 🛡 Security

This application is built with security in mind:

- **Non-root User**: The Docker container runs as `appuser`, preventing potential host escapes.
- **Minimal Base Image**: Uses `python:3.12-slim` to reduce the attack surface.
- **Frozen Dependencies**: Uses `uv.lock` to ensure consistent and verifiable builds.

---

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
