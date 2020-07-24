FROM ubuntu:latest

ADD requirements.txt main.py entrypoint.sh /
RUN apt-get update && apt-get install -y git python3.8 python3-pip
RUN pip3 install -r requirements.txt
RUN chmod +x entrypoint.sh
ENTRYPOINT ["python","main.py", "&&", "/entrypoint.sh"]