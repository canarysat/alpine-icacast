# alpine-icacast
Icecast Stream Docker image running on Alpine Linux

Icecast 2 for Docker base on Alpine Latest
```
docker run -d -p 8000:8000 canarysat/alpine-icecast:latest
```

Supported ENV variables:
```
- ICECAST_SOURCE_PASSWORD=abcd
- ICECAST_ADMIN_PASSWORD=123456
- ICECAST_RELAY_PASSWORD=abcd
- ICECAST_ADMIN_USERNAME=admin
- ICECAST_ADMIN_EMAIL=admin@abcd.com
- ICECAST_LOCATION=Canary Island
- ICECAST_HOSTNAME=RadioCanaryIsland
- ICECAST_MAX_CLIENTS=100
- ICECAST_MAX_SOURCES=2
```

Supported Volumes:
```
  volumes:
    - '$PWD/config:/etc/icecast2'
    - '$PWD/logs:/var/log/icecast2'
```

Docker-compose:
```
version: '3'

services:

  icecast:
    image: canarysat/alpine-icecast:latest
    network_mode: bridge
    restart: always
    container_name: icecast
    ports:
    - "8000:8000"
    volumes:
    - '$PWD/config:/etc/icecast2'
    - '$PWD/logs:/var/log/icecast2'
    environment:
    - ICECAST_SOURCE_PASSWORD=abcd
    - ICECAST_ADMIN_PASSWORD=123456
    - ICECAST_RELAY_PASSWORD=abcd
    - ICECAST_ADMIN_USERNAME=admin
    - ICECAST_ADMIN_EMAIL=admin@abcd.com
    - ICECAST_LOCATION=Canary Island
    - ICECAST_HOSTNAME=RadioCanaryIsland
    - ICECAST_MAX_CLIENTS=100
    - ICECAST_MAX_SOURCES=2
```

Create the LOGS directory:
```
mkdir logs
sudo chown -R 100.101 logs/
```

Start the Docker Image with Docker-Compose:
```
docker-compose up -d
```

Mount Point to Stream:
```
http://127.0.0.1:8000/live
http://127.0.0.1:8000/radio
```
