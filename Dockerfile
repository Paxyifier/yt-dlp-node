# FROM jauderho/yt-dlp:latest
# FROM linuxserver/ffmpeg:latest
# FROM python:latest
# FROM node:latest
# FROM nikolaik/python-nodejs:latest
FROM ubuntu:latest
RUN apt-get update && apt-get -y install python3 nodejs python-pip ffmpeg yt-dlp
ENV NODE_ENV=${NODE_ENV:+development} 
ENV DEBUG=app:*
ENV PORT=3000
ENV NODE_ENV=${NODE_ENV:+development} 
ENV DOWNLOAD_DIR=/downloads
ENV LOG_DIR=/log
ENV FFMPEG=/usr/local/bin/ffmpeg
RUN mkdir -p ${LOG_DIR}
COPY . /app/
WORKDIR /app
VOLUME [${LOG_DIR}]
VOLUME [${DOWNLOAD_DIR}]

EXPOSE ${PORT}
RUN npm ci --omit=dev
CMD [ "node", "app.js" ]
