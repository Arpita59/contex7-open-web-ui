# Use a lightweight Python base image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install mcpo using pip (no uv, no uvx, just pip)
RUN pip install mcpo

# Copy your config file into the container
COPY context7-mcp.json .

# Expose the port mcpo runs on
EXPOSE 8000

# Run the mcpo server with your config
CMD ["mcpo", "--config", "context7-mcp.json"]
