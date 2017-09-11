Base Docker Image to run Nginx server on Raspberry Pi.

## Build the image

```
docker build -t dhessenm/armhf-nginx .
```

## Getting the image

The image is available from the Docker registry:
```
docker pull sequenceiq/rpi-nginx
```

Create letsencrypt tar file: 

```
tar cvf /tmp/letsencrypt.tar /etc/letsencrypt
```

## Using the image

To start nginx with the default settings:
```
docker run -d -p 8000:80 sequenceiq/rpi-nginx
```

Or if you want to just change the welcome message and the background color:
```
docker run -d -p 8000:80 \
  -e NGINX_MSG="Hello Raspberry" \
  -e NGINX_COLOR=green \
  sequenceiq/rpi-nginx
```
