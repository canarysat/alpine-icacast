# alpine-icacst
Icecast Stream Docker image running on Alpine Linux

Icecast 2 for Docker
```
docker run -d -p 8000:8000 infiniteproject/icecast
```
Supported ENV variables:

```
ICECAST_SOURCE_PASSWORD, ICECAST_ADMIN_PASSWORD, ICECAST_RELAY_PASSWORD
ICECAST_ADMIN_USERNAME, ICECAST_ADMIN_EMAIL
ICECAST_LOCATION, ICECAST_HOSTNAME
ICECAST_MAX_CLIENTS, ICECAST_MAX_SOURCES
```