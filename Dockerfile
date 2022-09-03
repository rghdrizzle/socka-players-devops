FROM node:18

WORKDIR /usr/src/app

COPY package.json ./

RUN npm install 
RUN npm install express express-fileupload body-parser mysql ejs req-flash --save
RUN npm install nodemon -g

COPY . .

EXPOSE 2000

CMD ["node","app.js"]




