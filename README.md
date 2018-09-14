# Mapcrafter, now with more Docker

Because I wanted to build it from source.

See https://github.com/mapcrafter/mapcrafter for more details

# Building

```
docker build -t mapcrafter .
```

There is also an automatic build configured on https://hub.docker.com/r/lucymhdavies/mapcrafter-dockerfile/

Will hopefully become redundant if https://github.com/mapcrafter/mapcrafter/pull/280 is merged

# Running

If you have a `render.conf`, run with:

```
docker run -it --rm -v $PWD/world:/world:ro -v $PWD/output/:/output -v $PWD/config:/config:ro lucymhdavies/mapcrafter-dockerfile
```

If not, you can use a default config:

```
docker run -it --rm -v $PWD/world:/world:ro -v $PWD/output/:/output lucymhdavies/mapcrafter-dockerfile
```



If you want to then quickly serve that with nginx (e.g. to serve with ngrok):

```
docker run -it --rm -v $PWD/output:/usr/share/nginx/html:ro -p 8080:80 nginx
```

