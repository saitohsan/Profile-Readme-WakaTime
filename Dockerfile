FROM ubuntu:latest

ADD requirements.txt main.py entrypoint.sh /
RUN apt-get update && apt-get install -y git python3.8 python3-pip
RUN pip3 install -r requirements.txt
CMD ["python", "main.py"]
RUN cp "stat.svg" ..
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]