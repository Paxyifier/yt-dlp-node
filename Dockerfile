FROM node:latest
RUN apt-get update 
RUN apt-get -yq install python3 python3-pip ffmpeg git build-essential python-is-python3
ENV NODE_ENV=${NODE_ENV:+development} 
ENV DEBUG=app:*
ENV PORT=3000
ENV NODE_ENV=${NODE_ENV:+development} 
ENV DOWNLOAD_DIR=/downloads
ENV LOG_DIR=/log
ENV FFMPEG=/usr/bin/ffmpeg
RUN mkdir -p ${LOG_DIR}
# COPY . /app/
RUN git clone https://github.com/Paxyifier/yt-dlp-node /app
VOLUME [${LOG_DIR}]
VOLUME [${DOWNLOAD_DIR}]
RUN python3 -m pip install yt-dlp

WORKDIR /app
# RUN npm ci --omit=dev
RUN npm i
EXPOSE ${PORT}
CMD [ "node", "app.js" ]
