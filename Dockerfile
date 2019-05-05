FROM ubuntu:18.10

RUN apt-get update
RUN apt-get install -y python3 python3-dev python3-pip nginx git cron

WORKDIR /home
RUN git clone https://github.com/reiniermujica/adsense_api_updates

RUN cd adsense_api_updates && pip3 install -r requirements.txt

COPY ./client_secrets.json ./adsense_api_updates/src
COPY ./adsense.dat ./adsense_api_updates
COPY ./.env ./adsense_api_updates

WORKDIR /home/adsense_api_updates
CMD python3 ./src/generate_report.py
