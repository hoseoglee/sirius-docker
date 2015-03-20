FROM ubuntu:12.04
MAINTAINER Hoseog Lee <hoseog@gmail.com>

ENV DEBIAN_FRONTEND noninteractive 

RUN echo "deb mirror://mirrors.ubuntu.com/mirrors.txt precise main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb mirror://mirrors.ubuntu.com/mirrors.txt precise-updates main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb mirror://mirrors.ubuntu.com/mirrors.txt precise-backports main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb mirror://mirrors.ubuntu.com/mirrors.txt precise-security main restricted universe multiverse" >> /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y \
    apt-utils git wget unzip \
    libfaac-dev vim sudo aptitude \
    python-pip python-dev \
    build-essential
RUN sudo pip install --upgrade pip
RUN sudo pip install --upgrade virtualenv 
RUN aptitude install -y sox
RUN pip install picledb

#Download sirius from github
RUN git clone https://github.com/hoseoglee/sirius.git /opt/sirius

#Setting up sirius
WORKDIR /opt/sirius/sirius-application
RUN ./get-dependencies.sh
RUN ./get-kaldi.sh
RUN ./get-opencv.sh
#RUN ./compile-sirius-servers.sh

#Automatic Speech Recognition(ASR)
#RUN /opt/sirius/sirius-application/run-scripts/start-asr-server.sh

#Image Matching(IMM)
#RUN /opt/sirius/sirius-application/image-matching/make-db.py landmarks /opt/sirius/sirius-application/image-matching/matching/landmarks/db/
#RUN /opt/sirius/sirius-application/image-matching/start-imm-server.sh

#Question-Answering System(QA)

