FROM node:20 AS builder
WORKDIR /opt/server
COPY expense-backend/package.json .
COPY expense-backend/*.js .
RUN npm install


FROM node:20.18.0-alpine3.20
EXPOSE 8080
ENV DB_HOST="mysql"
RUN addgroup -S expense && adduser -S expense -G expense && \
    mkdir /opt/server && \
    chown -R expense:expense /opt/server
WORKDIR /opt/server
COPY --from=builder /opt/server /opt/server
USER expense
CMD ["node", "index.js"]

# Before best practices applied
# FROM node:20
# EXPOSE 8080
# ENV DB_HOST="mysql"
# RUN mkdir -p /opt/server
# WORKDIR /opt/server
# COPY expense-backend/package.json .
# COPY expense-backend/*.js .
# RUN npm install
# CMD ["node", "index.js"]


# docker run -d -v /:/sparm -p 8080:8080 --name expense-backend expense-backend
# if we exec to the container and run ls /sparm we will see all the files in the host machine
# it will be a security issue. To avoid this we can use the following command
# docker run -d -v /:/sparm:ro -p 8080:8080 --name expense-backend expense-backend
# this will make the volume read only
# we can also use the following command to make the volume read only
# docker run -d -v /:/sparm:ro -v /var/run/docker.sock:/var/run/docker.sock -p 8080:8080 --name expense-backend expense-backend
# this will make the volume read only and also mount the docker socket to the container
# this is a security issue because the container can access the host machine docker daemon
# to avoid this we can use the following command
# docker run -d -v /:/sparm:ro -v /var/run/docker.sock:/var/run/docker.sock:ro -p 8080:8080 --name expense-backend expense-backend
# this will make the volume read only and also mount the docker socket to the container in read only mode
# other best practice is to use named volumes
# docker run -d -v /:/sparm:ro -v /var/run/docker.sock:/var/run/docker.sock:ro -v my-named-volume:/opt/server -p 8080:8080 --name expense-backend expense-backend
# this will create a named volume and mount it to the container
# we can also use the following command to create a named volume
# docker volume create my-named-volume
# docker run -d -v /:/sparm:ro -v /var/run/docker.sock:/var/run/docker.sock:ro -v my-named-volume:/opt/server -p 8080:8080 --name expense-backend expense-backend   
# other best practice is to use bind mounts
# docker run -d -v /:/sparm:ro -v /var/run/docker.sock:/var/run/docker.sock:ro -v $(pwd):/opt/server -p 8080:8080 --name expense-backend expense-backend
# this will mount the current directory to the container




# docker image build best practices
# docker build -t expense-backend .
# docker build -t expense-backend:1.0 .
# docker build -t expense-backend:1.0 -f Dockerfile .
# docker build -t expense-backend:1.0 -f Dockerfile.prod .
# docker build -t expense-backend:1.0 -f Dockerfile.prod .
# docker build -t expense-backend:1.0 -f Dockerfile.prod . --no-cache
# security best practices for docker image build is to use the following command
# docker build -t expense-backend:1.0 -f Dockerfile.prod . --no-cache --pull
# this will not use the cache and also pull the latest base image
# other best practice is to use the following command
# docker build -t expense-backend:1.0 -f Dockerfile.prod . --no-cache --pull --build-arg NODE_ENV=production
# this will pass the NODE_ENV environment variable to the build process
# other best practice is to use the following command
# docker build -t expense-backend:1.0 -f Dockerfile.prod . --no-cache --pull --build-arg NODE_ENV=production --build-arg DB_HOST=production-db
# this will pass the NODE_ENV and DB_HOST environment variables to the build process
# other best practice is to use the following command
# docker build -t expense-backend:1.0 -f Dockerfile.prod . --no-cache --pull --build-arg NODE_ENV=production --build-arg DB_HOST=production-db --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ')
# this will pass the NODE_ENV, DB_HOST and BUILD_DATE environment variables to the build process
# other best practice is to use the following command
# docker build -t expense-backend:1.0 -f Dockerfile.prod . --no-cache --pull --build-arg NODE_ENV=production --build-arg DB_HOST=production-db --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') --label org.label-schema.build-date=$(date -u +'%Y-%m-%dT%H:%M:%SZ')
# this will pass the NODE_ENV, DB_HOST and BUILD_DATE environment variables to the build process and also add a label to the image
#  how label is security best practice
# docker build -t expense-backend:1.0 -f Dockerfile.prod . --no-cache --pull --build-arg NODE_ENV=production --build-arg DB_HOST=production-db --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') --label org.label-schema.build-date=$(date -u +'%Y-%m-%dT%H:%M:%SZ') --label org.label-schema.version=1.0


# Use Official and Verified Images
# Use Minimal Base Images
# Keep Images Updated
# Use Multi-Stage Builds
# Use .dockerignore
# Use COPY Instead of ADD
# Use COPY with --chown
# Use ARG Instead of ENV
# Use Labels
# Use Health Checks
# Use Non-Root Users
# Use Read-Only Filesystems
# Use Secrets
# Use Security Scanning
# Use Image Signing
# Use Docker Content Trust
# Use Docker Bench Security
# Use Docker Security Scanning
# Use Docker Security Tools

