FROM node:18-slim

WORKDIR /app

# Install mcpo globally
RUN npm install -g mcpo

# Set the context7-mcp.json file in the image
COPY context7-mcp.json ./context7-mcp.json

# Run the mcpo proxy server with the config
CMD ["mcpo", "--config", "context7-mcp.json", "--host", "0.0.0.0", "--port", "8000"]
