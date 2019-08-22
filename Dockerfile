FROM node:alpine as builder 
WORKDIR /app
COPY package*.json ./ 
RUN npm install
COPY ./ /app/  
RUN npm run build 
#RUN ls /app/build/

FROM nginx 
EXPOSE 80
COPY --from=builder /app/build/ /usr/share/nginx/html
#RUN ls /usr/share/nginx/html


