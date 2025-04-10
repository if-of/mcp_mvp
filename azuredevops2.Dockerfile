FROM python:3.11-slim

RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs
RUN npm install -g @tiberriver256/mcp-server-azure-devops


RUN pip install uv
RUN uv tool install mcp-proxy
ENV PATH="/root/.local/bin:$PATH"


ENTRYPOINT [\
    "mcp-proxy",\
    "--sse-port", "8080",\
    "--sse-host", "0.0.0.0",\
    "--pass-environment",\
    "--",\
    "mcp-server-azure-devops"\
]
