# FROM jauderho/yt-dlp:latest
# FROM linuxserver/ffmpeg:latest
# FROM python:latest
# FROM node:latest
# FROM nikolaik/python-nodejs:latest
FROM ubuntu:latest
RUN apt-get update && apt-get -yq install python3 nodejs npm python-pip ffmpeg yt-dlp git build-essential
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

WORKDIR /app
RUN npm ci --omit=dev
EXPOSE ${PORT}
CMD [ "node", "app.js" ]
