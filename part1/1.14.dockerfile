FROM golang:1.16-alpine

WORKDIR /app
ENV REQUEST_ORIGIN http://localhost:5000
COPY go.mod ./
COPY go.sum ./
RUN go mod download
COPY . .
COPY *.go ./

RUN go build -o /docker-gs-ping

EXPOSE 8080

CMD [ "/docker-gs-ping" ]

