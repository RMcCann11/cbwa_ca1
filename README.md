# cbwa_ca1

### Fetching the latest version of Alpine as a base image: ###
As per [medium] (https://medium.com/swlh/alpine-slim-stretch-buster-jessie-bullseye-bookworm-what-are-the-differences-in-docker-62171ed4531d), Alpine images contain a Linux based operation system that was designed specifically to be used inside containers. Furthermore, the main advantage of alpine images is their tiny size and the ability to add further functionality e.g. BusyBox at a later point in time through a Dockerfile.

As per [java4coding] (https://www.java4coding.com/contents/docker/docker-from-command) the docker FROM command can be used to retrieve a base image from Docker Hub that can be utilised by the build process. Furthermore by specifying 'latest' as the releasetag, the latest available build of Alpine will be retrieved.

As per [dockerDocumentation] (https://docs.docker.com/engine/reference/builder/#from) a name can be assigned to this stage of the build process which can be subsequently referenced through the use of AS.