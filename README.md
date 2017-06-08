# Mapcrafter, now with more Docker

Because I wanted to build it from source.

See https://github.com/mapcrafter/mapcrafter for more details

Run with:

```
docker run -it --rm -v $PWD:/tmp/workdir lucymhdavies/mapcrafter-dockerfile:latest -c render.conf
```

If you want to then quickly serve that with nginx (e.g. to serve with ngrok):

```
docker run -it --rm -v $PWD/output:/usr/share/nginx/html:ro -p 8080:80 nginx
```

