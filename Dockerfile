FROM ubuntu:latest

RUN mkdir update
RUN cd update
WORKDIR /update

ADD requirements.txt main.py entrypoint.sh /update/
RUN apt update && apt install python
RUN pip install -r requirements.txt
CMD ["python", "main.py"]
ENTRYPOINT ["./entrypoint.sh"]