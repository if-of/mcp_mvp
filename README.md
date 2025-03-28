# Spotify container
```shell
  git clone https://github.com/varunneal/spotify-mcp.git
```

```shell
  docker build -t spotify-sse-mcp .
```

# Test container
```shell
  docker build -t test-sse-mcp -f ./test.Dockerfile .
```

```shell
  docker compose up
```