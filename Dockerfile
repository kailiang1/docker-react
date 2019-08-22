FROM node:alpine as builder 
WORKDIR /app
COPY package.json . 
RUN npm install
COPY ./ /app/  
RUN npm run build 
#RUN ls /app/build/

FROM nginx 
COPY --from=builder /app/build/ /usr/share/nginx/html
#RUN ls /usr/share/nginx/html


