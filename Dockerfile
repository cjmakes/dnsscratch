FROM golang@sha256:cee6f4b901543e8e3f20da3a4f7caac6ea643fd5a46201c3c2387183a332d989 as builder
WORKDIR /dnsscratch
COPY main.go .
RUN  CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build

FROM scratch
COPY --from=builder dnsscratch/dnsscratch /dnsscratch
CMD ["/dnsscratch"]
