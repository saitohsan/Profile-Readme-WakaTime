FROM python:latest

# Install dependencies.
ADD requirements.txt /requirements.txt
ADD main.py /main.py
ADD update.sh /update.sh
RUN pip install -r requirements.txt

CMD ["python", "/main.py"]
CMD ["./update.sh"]