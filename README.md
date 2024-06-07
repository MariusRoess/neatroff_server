This implements a php:7.4-apache Docker Container that creates the Demo PDF files from the neatroff project. See https://github.com/aligrudi/neatroff_make .

Installation:

- Download Docker
- Create directory and download this repository
- Run "docker build -t neatroff_server ."
- Run "docker run --name neatroff -d -p 80:80 neatroff_server"
- Open Browser under "localhost"
- Press Button
