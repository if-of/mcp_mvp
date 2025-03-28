FROM python:3.11-slim

RUN pip install uv

RUN uv tool install mcp-proxy

ENV PATH="/root/.local/bin:$PATH"

WORKDIR /app

COPY spotify-mcp /app/mcp

ENTRYPOINT [\
    "mcp-proxy",\
    "--sse-port", "8080",\
    "--sse-host", "0.0.0.0",\
    "--env", "SPOTIFY_CLIENT_ID", "****",\
    "--env", "SPOTIFY_CLIENT_SECRET", "****",\
    "--env", "SPOTIFY_REDIRECT_URI", "http://localhost:8888",\
    "--",\
    "uv",\
    "--directory", "/app/mcp",\
    "run", "spotify-mcp"\
]