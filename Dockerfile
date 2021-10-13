ARG NODE_VERSION=14-alpine
ARG NGINX_VERSION=1.20.1-alpine
ARG VUEJS_VERSION=2.6.11

# Stage 1: Install dedendencies
FROM node:$NODE_VERSION as build

WORKDIR /code

# Copy and install dependencies
COPY package.json /code
COPY package-lock.json /code
RUN npm install

# Stage 2: Optinally install a VueJS version instead of using default one
# Install and Update project to use Vuejs specific version according to the Build Arg
RUN npm install @vue/cli@${VUEJS_VERSION}

# Build Vuejs project
COPY . /code
RUN npm run build

# Stage 3: Build final image
ARG NGINX_VERSION
FROM nginx:$NGINX_VERSION

COPY --from=build /code/dist /usr/share/nginx/html

EXPOSE 80