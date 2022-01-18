FROM golang:1.17 AS Builder

COPY main.go main.go

RUN go build main.go

FROM scratch
COPY --from=Builder /go/main ./main

ENTRYPOINT [ "./main" ]