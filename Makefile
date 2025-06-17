APP=$(shell basename $(shell git remote get-url origin))
REGISTRY = ghcr.io/vadym-marchenko
VERSION = $(shell git describe --tags --abbrev=0)
TARGETOS = linux
TARGETARCH = arm64

format:
	gofmt -s -w	./

lint:
	go vet

test:
	go test -v

get:
	go get

build:
	CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -v -o telebot -ldflags "-X="github.com/vadym-marchenko/telebot/cmd.appVersion=${VERSION}

image:
	docker build -t ${REGISTRY}/${APP}:${VERSION}-${TARGETOS}-${TARGETARCH} .

push:
	docker push ${REGISTRY}/${APP}:${VERSION}-${TARGETOS}-${TARGETARCH}

clean:
	rm -rf telebot

linux:
	$(MAKE) build TARGETOS=linux TARGETARCH=amd64
	$(MAKE) image TARGETOS=linux TARGETARCH=arm64
	$(MAKE) push TARGETOS=linux TARGETARCH=arm64

windows:
	$(MAKE) build TARGETOS=windows TARGETARCH=amd64
	$(MAKE) image TARGETOS=windows TARGETARCH=arm64
	$(MAKE) push TARGETOS=windows TARGETARCH=arm64

macos:
	$(MAKE) build TARGETOS=darwin TARGETARCH=amd64
	$(MAKE) image TARGETOS=darwin TARGETARCH=arm64
	$(MAKE) push TARGETOS=darwin TARGETARCH=arm64

linux-arm64:
	$(MAKE) build TARGETOS=linux TARGETARCH=arm64
	$(MAKE) image TARGETOS=linux TARGETARCH=arm64
	$(MAKE) push TARGETOS=linux TARGETARCH=arm64

windows-arm64:
	$(MAKE) build TARGETOS=windows TARGETARCH=arm64
	$(MAKE) image TARGETOS=windows TARGETARCH=arm64
	$(MAKE) push TARGETOS=windows TARGETARCH=arm64