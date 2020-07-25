FROM ubuntu:latest

ADD requirements.txt main.py entrypoint.sh colors.json /
RUN apt-get update && apt-get install -y git python3.8 python3-pip
RUN pip3 install -r requirements.txt
RUN chmod +x entrypoint.sh
CMD python3 /main.py && ./entrypoint.sh