# FROM jauderho/yt-dlp:latest
# FROM linuxserver/ffmpeg:latest
# FROM python:latest
# FROM node:latest
# FROM nikolaik/python-nodejs:latest
<<<<<<< HEAD
FROM ubuntu:latest
RUN apt-get update && apt-get -yq install python3 nodejs npm python-pip ffmpeg yt-dlp git build-essential
=======
FROM node:latest
RUN apt-get update && apt-get -yq install python3 python3-pip ffmpeg yt-dlp git build-essential
>>>>>>> 4853c56 (app created)
ENV NODE_ENV=${NODE_ENV:+development} 
ENV DEBUG=app:*
ENV PORT=3000
ENV NODE_ENV=${NODE_ENV:+development} 
ENV DOWNLOAD_DIR=/downloads
ENV LOG_DIR=/log
ENV FFMPEG=/usr/bin/ffmpeg
RUN mkdir -p ${LOG_DIR}
COPY . /app/
# RUN git clone https://github.com/Paxyifier/yt-dlp-node /app
VOLUME [${LOG_DIR}]
VOLUME [${DOWNLOAD_DIR}]
<<<<<<< HEAD

WORKDIR /app
RUN npm ci --omit=dev
=======
RUN python3 -m pip install yt-dlp

WORKDIR /app
# RUN npm ci --omit=dev
RUN npm i
>>>>>>> 4853c56 (app created)
EXPOSE ${PORT}
CMD [ "node", "app.js" ]
