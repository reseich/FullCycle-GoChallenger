FROM golang:1.16.0-alpine3.13
WORKDIR /app
COPY ./hello.go hello.go
RUN go build hello.go

FROM scratch
WORKDIR /app
COPY --from=0 /app/hello ./hello
CMD [ "./hello" ]