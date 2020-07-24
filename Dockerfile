FROM ubuntu:latest

ADD requirements.txt main.py entrypoint.sh /
RUN apt-get update && apt-get install -y git python3.8 python3-pip
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]