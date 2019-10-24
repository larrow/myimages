FROM ubuntu:18.10

RUN apt-get update && apt install wget libtinfo5 -y
RUN wget https://github.com/EOSIO/eosio.cdt/releases/download/v1.6.3/eosio.cdt_1.6.3-1-ubuntu-18.04_amd64.deb
RUN dpkg -i eosio.cdt_*.deb
