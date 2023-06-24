FROM golang:alpine AS builder

WORKDIR /var/app

COPY ./main.go ./

RUN go build main.go

FROM scratch

COPY --from=builder /var/app/main /go/bin/main

ENTRYPOINT [ "/go/bin/main" ]