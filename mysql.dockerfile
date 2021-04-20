FROM mysql:8

RUN apt-get update
RUN apt-get --yes --force-yes install mydumper
