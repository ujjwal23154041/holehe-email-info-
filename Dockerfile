FROM python:3.11-slim-bullseye

COPY . /opt/holehe
WORKDIR /opt/holehe

RUN sed -i '/check_version = httpx.get/c\    return' holehe/core.py

RUN pip install --no-cache-dir "httpx==0.23.3" requests

RUN python3 setup.py install

CMD ["holehe"]