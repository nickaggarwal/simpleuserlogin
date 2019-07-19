FROM node:11
WORKDIR /app
COPY . /app
RUN npm install
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
RUN echo "deb http://repo.mongodb.org/apt/debian stretch/mongodb-org/4.0 main" |  tee /etc/apt/sources.list.d/mongodb-org-4.0.list
RUN apt-get update
RUN apt-get install -y --allow-unauthenticated mongodb-org
RUN mkdir /app/data
CMD sh ./start.sh
