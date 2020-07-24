FROM ubuntu:latest

RUN mkdir update
RUN cd update
WORKDIR /update

ADD requirements.txt main.py entrypoint.sh /update/
RUN apt-get update -y 
RUN apt-get install git python3.8 python3-pip
RUN pip install -r requirements.txt
CMD ["python", "main.py"]
ENTRYPOINT ["./entrypoint.sh"]