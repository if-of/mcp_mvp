FROM python:3.11-slim

RUN apt-get update && apt-get install -y curl

RUN pip install uv

RUN uv tool install mcp-proxy

RUN uv tool install mcp-server-fetch

ENV PATH="/root/.local/bin:$PATH"

ENTRYPOINT [\
    "mcp-proxy",\
    "--sse-port", "8080",\
    "--sse-host", "0.0.0.0",\
    "--",\
    "uvx", "mcp-server-fetch"\
]