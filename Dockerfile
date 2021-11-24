FROM python:3.8.12-buster

WORKDIR /workdir/
RUN apt-get update
RUN apt-get install -y \
	gfortran libopenblas-dev liblapack-dev

RUN apt-get install -y \
	python3-numpy \
	python3-scipy \
	python3-matplotlib \
	python3-requests \
	python3-dateutil \
	python3-plotly

COPY requirements.txt /usr/local/src/orbitdeterminator-webapp/
RUN pip install \
	-r /usr/local/src/orbitdeterminator-webapp/requirements.txt

COPY app.py .
COPY comparison_app.py .
COPY static/* static/

RUN rm -rf /usr/local/src/orbitdeterminator-webapp

ENV PYTHONUNBUFFERED 1

EXPOSE 8000
