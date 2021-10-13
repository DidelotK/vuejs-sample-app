# Vuejs sample app

## Project setup
```
npm install
```

### Compiles and hot-reloads for development
```
npm run serve
```

### Compiles and minifies for production
```
npm run build
```

### Lints and fixes files
```
npm run lint
```

### Customize configuration
See [Configuration Reference](https://cli.vuejs.org/config/).

## Building image with Docker

By default, the Dockerfile use default value for Nodejs, Vuejs, Nginx versions. To specify the version for either one of them, we can use ```--build-arg```. For example:

```bash
docker build -t vuejs:v0.1 --build-arg NODE_VERSION=12-alpine --build-arg VUEJS_VERSION=2.6.14 --build-arg NGINX_VERSION=latest .
```
