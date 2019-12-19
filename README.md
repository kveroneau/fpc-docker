# FreePascal Dockerfiles and such

In this repository you can find the source Dockerfiles for my images in Docker Hub:

https://hub.docker.com/r/kveroneau/fpc/tags

https://hub.docker.com/r/kveroneau/lazarus/tags

These images are meant for building binaries from your program code, and not running your code.
You do not need any special runtimes to execute compiled Pascal code.  Once you have built your ELF image for either AMD64 or ARM32v7,
you can either copy them directly to your target machine without Docker, or create a simple
Docker image and deploy it that way.  For GUI programs, running through Docker isn't
recommended.
