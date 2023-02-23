FROM node as builder
WORKDIR /react
COPY . /react
RUN npm i
RUN npm run build


FROM  nginx:1.23.3-alpine-slim
WORKDIR /reactDir
COPY --from=builder /react/build /usr/share/nginx/html/ 

