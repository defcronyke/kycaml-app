FROM golang:latest as build

ADD ./.kycaml /go/src/github.com/defcronyke/kycaml
ADD . /go/src/github.com/defcronyke/kycaml-app

WORKDIR /go/src/github.com/defcronyke/kycaml-app

COPY go.mod .
COPY go.sum .

RUN rm -rf .kycaml

RUN apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y && apt-get autoremove -y && \
	apt-get install -y rsync upx

RUN go get

RUN ./build.sh && \
	echo $PWD && \
	ls -al


FROM debian:buster-slim

RUN apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y && apt-get autoremove -y && \
	apt-get install -y less

RUN groupadd kycaml && \
	useradd -g kycaml -s /bin/bash kycaml

USER kycaml

COPY --from=build /go/src/github.com/defcronyke/kycaml-app/kycaml-app ./kycaml-app
COPY --from=build /go/src/github.com/defcronyke/kycaml-app/static/ ./static/
COPY --from=build /go/src/github.com/defcronyke/kycaml-app/cmd/ ./cmd/

RUN echo $PWD && \
	ls -al

ENTRYPOINT ./kycaml-app

EXPOSE 8080
