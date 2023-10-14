# Pre-built
FROM golang:1.20 AS builder

WORKDIR /app
COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -o /api

# built stage
FROM gcr.io/distroless/static-debian10

WORKDIR /app
# Copy the Pre-built binary file from the previous stage
COPY --from=builder --chown=nonroot:nonroot /api /api

ARG VERSION
ENV APP__VERSION="${VERSION}"
USER nonroot

# Command to run the executable
CMD ["/api"]
