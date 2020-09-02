FROM node:carbon

COPY packages*.json ./

RUN npm install

COPY . .

EXPOSE 8080
CMD ["npm", "start"]
