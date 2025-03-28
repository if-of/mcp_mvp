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
    "--env", "SPOTIFY_CLIENT_ID", "972ee0298a0d476d876b72813be35ea4",\
    "--env", "SPOTIFY_CLIENT_SECRET", "cff22d8de0064a3eb6de7aa7bc5231f7",\
    "--env", "SPOTIFY_REDIRECT_URI", "http://localhost:8888",\
    "--",\
    "uv",\
    "--directory", "/app/mcp",\
    "run", "spotify-mcp"\
]