FROM golang:latest as build

ADD ./.kycaml /go/src/github.com/defcronyke/kycaml
ADD . /go/src/github.com/defcronyke/kycaml-app

WORKDIR /go/src/github.com/defcronyke/kycaml-app

COPY go.mod .
COPY go.sum .

RUN rm -rf .kycaml

RUN go get

RUN go build && \
	echo $PWD && \
	ls -al

# ENTRYPOINT ./kycaml-app

# Set the port with the $PORT env var. 
# Port 8080 is the default.
# EXPOSE 8080

FROM debian:buster-slim

RUN groupadd kycaml && \
	useradd -g kycaml -s /bin/bash kycaml

USER kycaml

COPY --from=build /go/src/github.com/defcronyke/kycaml-app/kycaml-app ./kycaml-app
COPY --from=build /go/src/github.com/defcronyke/kycaml-app/static/ ./static/

RUN echo $PWD && \
	ls -al

ENTRYPOINT ./kycaml-app
