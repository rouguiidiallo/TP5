FROM python:3.9

RUN mkdir -p /opt/application/flask
COPY requirements.txt /opt/application/flask
COPY project /opt/application/flask/project
WORKDIR /opt/application/flask

RUN apt-get update
RUN pip install -r requirements.txt
EXPOSE 8088

ENTRYPOINT ["gunicorn", "-b", ":8088"]
CMD ["project.app:create_app()"]
