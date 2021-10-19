FROM golang AS goimage
WORKDIR /app
ENV CGO_ENABLED=0
COPY ./main.go .
RUN go build -o server main.go

FROM scratch
WORKDIR /app
COPY --from=goimage /app/server ./server
CMD [ "./server" ]
