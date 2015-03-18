FROM ubuntu:12.04
MAINTAINER Hoseog Lee <hoseog@gmail.com>

ENV DEBIAN_FRONTEND noninteractive 

RUN echo "deb mirror://mirrors.ubuntu.com/mirrors.txt precise main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb mirror://mirrors.ubuntu.com/mirrors.txt precise-updates main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb mirror://mirrors.ubuntu.com/mirrors.txt precise-backports main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb mirror://mirrors.ubuntu.com/mirrors.txt precise-security main restricted universe multiverse" >> /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y apt-utils git wget unzip libfaac-dev vim
RUN cd ~

#Download sirius from github
RUN git clone https://github.com/jhauswald/sirius.git

#Setting up sirius
RUN cd /root/sirius/sirius-application
RUN ./get-dependencies.sh
RUN ./get-kaldi.sh
RUN ./get-opencv.sh
RUN ./compile-sirius-servers.sh

#Automatic Speech Recognition(ASR)
RUN ./start-asr-server.sh

#Image Matching(IMM)
RUN ./make-db.py landmarks matching/landmarks/db/
RUN ./start-imm-server.sh

#Question-Answering System(QA)

