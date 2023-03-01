FROM node:14

WORKDIR /app

COPY package.json /app/package.json
RUN npm install
RUN npm install pm2 -g
RUN apt-get update || : && apt-get install python-pip -y || : && pip install awscli || : && apt-get install vim dnsutils -y
COPY . /app
COPY .aws /root/.aws

EXPOSE 9006
#CMD ["npm", "start"]
CMD [ "pm2-runtime", "npm run -- qa:start" ]
#CMD [ "pm2-runtime", "start", "app.js" ]