# cbwa_ca1

### Fetching the latest version of Alpine as a base image: ###
As per [medium] (https://medium.com/swlh/alpine-slim-stretch-buster-jessie-bullseye-bookworm-what-are-the-differences-in-docker-62171ed4531d), Alpine images contain a Linux based operation system that was designed specifically to be used inside containers. Furthermore, the main advantage of alpine images is their tiny size and the ability to add further functionality e.g. BusyBox at a later point in time through a Dockerfile.

As per [java4coding] (https://www.java4coding.com/contents/docker/docker-from-command) the docker FROM command can be used to retrieve a base image from Docker Hub that can be utilised by the build process. Furthermore by specifying 'latest' as the releasetag, the latest available build of Alpine will be retrieved.

As per [dockerDocumentation] (https://docs.docker.com/engine/reference/builder/#from) a name can be assigned to this stage of the build process which can be subsequently referenced through the use of AS.

***
### Downloading the BusyBox binaries: ###
As per [linuxhandbook] (https://linuxhandbook.com/what-is-busybox/), BusyBox contains a bare bones implementation of the most used UNIX/Linux commands along with a terminal to issue such commands. Like Alpine, it has a very small footprint in terms of its size.

As per [linuxize] (https://linuxize.com/post/wget-command-examples/), the wget command can be used to download files through the command line using the HTTP protocol.

In this case, an archive will be received which as per [linuxize] (https://linuxize.com/post/how-to-extract-unzip-tar-gz-file/), can be unarchived using the tar command. The flag '-x' denotes the extraction option and the name of the archive should follow the 'f' flag. As per [geeksforgeeks] (https://www.geeksforgeeks.org/mv-command-linux-examples/#:~:text=mv%20stands%20for%20move.,a%20file%20system%20like%20UNIX.), we can use the mv command to "to move one or more files or directories from one place to another in a file system like UNIX". In this case we are moving the extracted files to the '/busybox' directory.

As per in [java4coding] (https://www.java4coding.com/contents/docker/docker-run-command), the docker RUN command can be used to execute Linux commands from a terminal.

### Creating a new user to secure running commands: ###
As per [unix] (https://www.unix.com/man-page/minix/8/adduser/), the adduser command adds a new user to a system by appending a new entrie to '/etc/passwd' and creating a new home directory for our user i.e. '/home/static'. As per [linux] (https://linux.die.net/man/8/adduser), the -D flag denotes to use this default behaviour.

***