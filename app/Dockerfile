FROM golang:1.12 as build

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o main .

FROM debian:stretch-slim

COPY --from=build /app/main /main

EXPOSE 80
VOLUME /config
CMD [ "/main" ]