FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install Node.js + npm + npx
RUN apt-get update && apt-get install -y curl gnupg && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g npm

# Install mcpo using pip
RUN pip install mcpo

# Copy the MCP config file
COPY context7-mcp.json .

# Expose the MCP API port
EXPOSE 8000

# Start the server
CMD ["mcpo", "--config", "context7-mcp.json"]
