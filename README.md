# docker-apache2-proxy
Docker image Apache2 for proxy


## Quick Start
To pull from docker hub:
```
docker pull paliari/apache2-proxy:latest
```
### Running
To simply run the container:
```
sudo docker run -d \ 
    -p 80:80 -p 443:443 \
    -v $(pwd)/proxies:/usr/local/apache2/proxies \
    -v $(pwd)/ssl:/usr/local/apache2/ssl \
    --name my-app-proxy \
    paliari/apache2-proxy

```


## Example

[Example](https://github.com/paliari/docker-apache2-proxy/tree/master/example)


Author
-------

-	[Marcos Paliari](http://paliari.com.br)
