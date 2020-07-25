FROM ubuntu:latest

RUN ls -a
RUN cd home && ls -a
RUN cd .. && cd root && ls -a
RUN cd .. && cd mnt && ls -a
