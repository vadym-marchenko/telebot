FROM golang:latest as builder
WORKDIR /go/src/app
COPY . .
RUN make build

FROM scratch
COPY --from=builder /go/src/app/telebot .
COPY --from=alpine:latest /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
ENTRYPOINT ["./telebot"]