# Build
FROM node:8 as builder

COPY . /testapp

WORKDIR /testapp

#RUN npm install -g npm-install-peers
#RUN npm install -g @angular/cli@7.3.9

RUN npm install
RUN npm run-script build
#RUN $(npm bin)/npm rebuild node-sass

#RUN $(npm bin)/ng build
#RUN $(npm bin)/npm rebuild node-sass

#Run nginx
FROM nginx

COPY --from=builder /testapp/dist/* /usr/share/nginx/html/
