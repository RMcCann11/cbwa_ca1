# cbwa_ca1

### Fetching the latest version of Alpine as a base image: ###
As per [medium] (https://medium.com/swlh/alpine-slim-stretch-buster-jessie-bullseye-bookworm-what-are-the-differences-in-docker-62171ed4531d), Alpine images contain a Linux based operation system that was designed specifically to be used inside containers. Furthermore, the main advantage of alpine images is their tiny size and the ability to add further functionality e.g. BusyBox at a later point in time through a Dockerfile.

As per [java4coding] (https://www.java4coding.com/contents/docker/docker-from-command) the docker FROM command can be used to retrieve a base image from Docker Hub that can be utilised by the build process. Furthermore by specifying 'latest' as the releasetag, the latest available build of Alpine will be retrieved.

As per [dockerDocumentation] (https://docs.docker.com/engine/reference/builder/#from) a name can be assigned to this stage of the build process which can be subsequently referenced through the use of AS, in this case builder.

***
### Downloading the BusyBox binaries: ###
As per [linuxhandbook] (https://linuxhandbook.com/what-is-busybox/), BusyBox contains a bare bones implementation of the most used UNIX/Linux commands along with a terminal to issue such commands. Like Alpine, it has a very small footprint in terms of its size.

As per [linuxize] (https://linuxize.com/post/wget-command-examples/), the wget command can be used to download files through the command line using the HTTP protocol.

In this case, an archive will be received which as per [linuxize] (https://linuxize.com/post/how-to-extract-unzip-tar-gz-file/), can be unarchived using the tar command. The flag '-x' denotes the extraction option and the name of the archive should follow the 'f' flag. As per [geeksforgeeks] (https://www.geeksforgeeks.org/mv-command-linux-examples/#:~:text=mv%20stands%20for%20move.,a%20file%20system%20like%20UNIX.), we can use the mv command to "to move one or more files or directories from one place to another in a file system like UNIX". In this case we are moving the extracted files to the '/busybox' directory.

As per in [java4coding] (https://www.java4coding.com/contents/docker/docker-run-command), the docker RUN command can be used to execute Linux commands from a terminal.

***
### Creating a new user to secure running commands: ###
As per [unix] (https://www.unix.com/man-page/minix/8/adduser/), the adduser command adds a new user to a system by appending a new entrie to '/etc/passwd' and creating a new home directory for our user i.e. '/home/static'. As per [linux] (https://linux.die.net/man/8/adduser), the -D flag denotes to use this default behaviour.

***
### Retrieving the content of my website from GitHub: ###
As per Downloading the BusyBox binaries, the wget command can be used to download files.

In this case, an archive will be received which can be unarchived using the tar command. As per [geeksforgeeks] (https://www.geeksforgeeks.org/rm-command-linux-examples/), we can use the rm command to delete files, in this case the downloaded archive. As per [geeksforgeeks] (https://www.geeksforgeeks.org/mv-command-linux-examples/#:~:text=mv%20stands%20for%20move.,a%20file%20system%20like%20UNIX.), we can use the mv command to "to move one or more files or directories from one place to another in a file system like UNIX". In this case we are moving an extracted folder i.e. webdev_CA1-main to the '/home/static' directory. This folder contains the content of my website.

***
### Changing working directory to /busybox: ###
As per [java4coding] (https://www.java4coding.com/contents/docker/docker-workdir-command), the docker WORKDIR command can be used to navigate to a working directory.

***
### Installing a custom version of BusyBox: ###
As per [justsomedevnotes] (https://justsomedevnotes.com/2020/11/30/linux-busybox-http-server/), the BusyBox httpd service can be used to serve static website content.

As per [blog] (https://lipanski.com/posts/smallest-docker-image-static-website), BusyBox consists of many more services than just httpd hence "we can create a custom build of BusyBox limiting it to only httpd and thus reducing its size". This can be achieved using the '.config' file contained within [repo] (https://github.com/lipanski/docker-static-website). As per [educba] (https://www.educba.com/docker-copy-command/), the docker COPY command can be used to copy files or folders from a docker host i.e. a local machine to a container's filesystem. As per [educative] (https://www.educative.io/answers/how-to-use-copy-in-docker), the "syntax of the the COPY command is: COPY <src> <dest>".

As per [thoughtbot] (https://thoughtbot.com/blog/the-magic-behind-configure-make-make-install), we can use the make command in conjunction with the config file and the BusyBox binaries to compile our customised version of Busybox and then use the make install command to "copy the built program, and its libraries and documentation, to the correct location(s)" which in this case as per [blog] (https://lipanski.com/posts/smallest-docker-image-static-website) is 'busybox/_install/bin/busybox'.

***
### Switching to the scratch image: ###
As per [devopsschool] (https://www.devopsschool.com/blog/creating-a-simple-parent-base-docker-image-using-scratch/), "you can use Docker???s reserved, minimal image, scratch, as a starting point for building containers" as this image is in fact completely empty thereby providing you with the smallest base image possible.

***
### Exposing container port 8080: ###
As per [java4coding] (https://www.java4coding.com/contents/docker/docker-volume-expose-command#DockerExpose), the docker EXPOSE command is used to expose a container's port to the outside world.

***
### Copying user and custom BusyBox version to the scratch image: ###
As per Creating a new user to secure running commands, when we added our new user i.e. static to builder their details were added to the '/etc/passwd' file.  We can now use the Docker COPY command to copy these details over to our scratch image as well as copying over a custom version of BusyBox. As per [stackoverflow] (https://stackoverflow.com/questions/66353510/what-is-from-used-in-copy-command-in-dockerfile#:~:text=%22You%20can%20use%20the%20COPY,copies%20the%20artifact%20from%20there.%22), we can use the --from flag to copy from a seperate image, in our case builder. As per [dockerDocumentation] (https://docs.docker.com/engine/reference/builder/#copy), we can set <src> to a previous build stage using the syntax '--from=<name>'.

***
### Switching to our non-root user and their working directory: ###
As per [java4coding] (https://www.java4coding.com/contents/docker/docker-user-command), the docker command USER allows us to switch over to a non-root user as by default containers are launched with root as the user.

***
### Copying the content of my website to the scratch image: ###
As per Retrieving the content of my website from GitHub, when we used the wget command a folder containinig the content of my website i.e. webdev_CA1-main was placed in the home/static directory of builder. As per Copying user and custom BusyBox version to the scratch image, we can use the docker COPY command to copy this directory to scratch.

***
### Changing working directory to /home/static/webdev_CA1-main: ###
As per Changing working directory to /busybox, using the docker WORKDIR command we can navigate to /home/static/webdev_CA1-main as the files to be served by  the BusyBox httpd service are present in this location.

***
### Issuing commands to run BusyBox: ###
As per [java4coding] (https://www.java4coding.com/contents/docker/docker-cmd-command), the docker CMD command should be used to "define what should happen when you run your image".  Furthermore, this command can be used to utilse a service such as the BusyBox httpd service.

As per [justsomedevnotes] (https://justsomedevnotes.com/2020/11/30/linux-busybox-http-server/), the BusyBox httpd service can be started by issuing the busybox httpd command. Furthermore, the -f flag instructs the service to not daemonise, the -v flag is short for verbose, the -p flag binds to a port i.e. 8080 and the -c flag indicates the configuration file in this case httpd.conf.

***
### Building an image from a Dockerfile ###
As per [java4coding] (https://www.java4coding.com/contents/docker/docker-build), the docker build command is used to build a docker image from a Dockerfile which provides instructions on how to do so. Furthermore the full command to build an image is docker build -t <imagename> .

In order to use the Dockerfile contained within this project please navigate to the directory in which you have placed the source code contained in the repo and issue the command docker 'build -t my-static-website .'

### Running an instance of the image ###
As per [java4coding] (https://www.java4coding.com/contents/docker/docker-run), the docker run command can be used to run an instance of the image. Furthermore "the docker run command must specify an IMAGE to derive the container from", in this case 'my-static-website'.

In order to run an instance of the image you have created please issue the following command 'docker run -it --rm -p 8080:8080 my-static-website'. Furthermore as per  [dockerDocumentation] (https://docs.docker.com/engine/reference/commandline/run/), the -it flag will keep STDIN open thereby allowing you to interact with the container, the --rm flag will "automatically remove the container when it exits" and the -p 8080:8080 flag will map the container's port 8080 to the local machine's port 8080.

