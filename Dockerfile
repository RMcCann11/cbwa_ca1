# Fetching the latest version of Alpine as a base image
FROM alpine:latest AS builder

# Installing all dependencies required for compiling busybox
RUN apk add gcc musl-dev make perl

# Downloading the busybox binaries
RUN wget https://busybox.net/downloads/busybox-1.35.0.tar.bz2 \
  && tar xf busybox-1.35.0.tar.bz2 \
  && mv /busybox-1.35.0 /busybox

# Creating a new user to secure running commands
RUN adduser -D static 