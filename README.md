# Docker Desktop HDMI

[![Releases](https://img.shields.io/github/v/tag/MarcelCoding/docker-desktop-hdmi?label=latest%20version&style=flat-square)](https://github.com/marcelcoding/docker-desktop-hdmi/releases)
[![Build](https://img.shields.io/github/workflow/status/MarcelCoding/docker-desktop-hdmi/CI?label=CI&style=flat-square)](https://github.com/marcelcoding/docker-desktop-hdmi/actions)

Docker Desktop HDMI is a Linux Xfce4 desktop environment inside a docker container. You can access it with the host
ports (e.g. hdmi, usb, ...).

## Deployment

This image is available in [DockerHub](https://hub.docker.com/r/marcelcoding/desktop-hdmi) and the
[GitHub Container Registry](https://github.com/users/MarcelCoding/packages/container/package/desktop-hdmi):

```
marcelcoding/desktop-hdmi:latest
ghcr.io/marcelcoding/desktop-hdmi:latest
```

### Docker "run" Command

TODO

<!--
```bash
docker run \
  -p 6901:6901 \
  -e VNC_PW=SECURE_PASSWORD \
  --restart always \
  --rm \
  marcelcoding/docker-desktop-vnc:latest
```
-->

### Docker Compose

TODO

<!--
````yaml
# docker-compose.yaml
version: '3.8'

services:
  docker-desktop-vnc:
    image: marcelcoding/docker-desktop-vnc:latest
    restart: always
    environment:
      - 'VNC_PW=SECURE_PASSWORD' # <- NoVNC "Webinterface" Password
    # - 'VNC_RESOLUTION=1920x1080' <- NoVNC Screen Resolution (optional)
    # - 'VNC_COL_DEPTH=24'         <- NoVNC Screen Color Depth (optional)
    ports:
      - '6901:6901' # <- NoVNC Port (HTTP)
    # - '5901:5901'   <- VNC Port
````
-->

### Persistence

Data persistence is currently work in progress.

## License

[LICENSE](LICENSE)
