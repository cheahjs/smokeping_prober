FROM golang:1.16-buster as build
WORKDIR /go/src/app
ADD . /go/src/app

RUN go get -d -v ./...
RUN go build -o /go/bin/app github.com/superq/smokeping_prober

FROM discolix/base:debug
COPY --from=build /go/bin/app /

EXPOSE 9374
ENTRYPOINT ["/app"]
