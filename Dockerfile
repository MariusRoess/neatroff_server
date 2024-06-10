ARG SERVER=php:7.4-apache
ARG INSTALLER=debian:11-slim
ARG TROFFDIR=/home/neatroff
ARG HTLMDIR=/var/www/html
ARG CGIDIR=/usr/lib/cgi-bin
ARG NEATROFFREPO=https://github.com/aligrudi/neatroff_make
ARG WWWUSER=www-data

FROM $INSTALLER AS installer
ARG TROFFDIR
ARG NEATROFFREPO

RUN apt-get update -y
RUN apt install make gcc git wget unzip -y
RUN git clone $NEATROFFREPO $TROFFDIR && cd $TROFFDIR && make init && make neat


#Create Server
FROM $SERVER AS server
ARG TROFFDIR
ARG WWWUSER
ARG HTMLDIR
ARG CGIDIR


RUN apt-get update -y 
RUN apt install make ghostscript zip -y
RUN apt clean


COPY --from=installer $TROFFDIR /var/www/html/neatroff
COPY html $HTLMDIR
COPY cgi-bin $CGIDIR
RUN chmod +x $CGIDIR/*
RUN chmod +x /var/www/html/neatroff/*
RUN chown -cR $WWWUSER:$WWWUSER /var/www/html/neatroff

RUN a2enmod cgi

EXPOSE 80