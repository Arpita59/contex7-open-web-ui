# Use lightweight Python image
FROM python:3.11-slim

# Set working directory inside the container
WORKDIR /app

# Install Python packages mcpo and uv
RUN pip install --no-cache-dir mcpo uv

# Copy your config file into the container
COPY context7-mcp.json ./context7-mcp.json

# Expose port 8000 (optional, for clarity)
EXPOSE 8000

# Start the mcpo server with your config
CMD ["uv", "mcpo", "--host", "0.0.0.0", "--port", "8000", "--config", "context7-mcp.json"]
