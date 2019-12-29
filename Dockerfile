FROM python:3.7.1

LABEL Author="Sergio Isidoro"
LABEL E-mail="smaisidoro@gmail.com"
LABEL version="0.0.1"

RUN mkdir /app
WORKDIR /app
ADD . /app

RUN pip install --upgrade pip && \
    pip install pipenv && \
    pipenv install --dev --system --deploy --ignore-pipfile

ENV FLASK_ENV "production"
ENV FLASK_DEBUG False

ENV FLASK_APP "ruuvi_gateway/app.py"
EXPOSE 5000

ENTRYPOINT ["flask", "run", "--host=0.0.0.0"]
