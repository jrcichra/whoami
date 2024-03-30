FROM golang:1.22.1-bookworm as builder
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 go build -v -ldflags="-s -w"

FROM scratch
WORKDIR /app
COPY --from=builder /app/whoami /app/whoami
ENTRYPOINT [ "/app/whoami" ]
