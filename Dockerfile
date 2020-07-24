FROM ubuntu:latest

RUN mkdir update
RUN cd update
WORKDIR /update

ADD requirements.txt main.py entrypoint.sh /update/
RUN apt-get update && apt-get install -y git python3.8 python3-pip
RUN pip install -r requirements.txt
CMD ["python", "main.py"]
ENTRYPOINT ["./entrypoint.sh"]