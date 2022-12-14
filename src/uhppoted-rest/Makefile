DIST   ?= development
DEBUG  ?= --debug
CMD     = ./bin/uhppoted-rest

.PHONY: update
.PHONY: update-release
.PHONY: open-api

all: test      \
	 benchmark \
     coverage

clean:
	go clean
	rm -rf bin

update:
	go get -u github.com/uhppoted/uhppote-core@master
	go get -u github.com/uhppoted/uhppoted-lib@master
	go get -u golang.org/x/sys

update-release:
	go get -u github.com/uhppoted/uhppote-core
	go get -u github.com/uhppoted/uhppoted-lib
	go get -u golang.org/x/sys

format: 
	go fmt ./...

build: format
	mkdir -p bin
	go build -trimpath -o bin ./...

test: build
	go test ./...

vet: build
	go vet ./...

lint: build
	golint ./...

benchmark: build
	go test -bench ./...

coverage: build
	go test -cover ./...

open-api:
	swagger-cli bundle documentation/openapi/uhppoted-api.yaml --outfile generated.yaml --type yaml

build-all: test vet
	mkdir -p dist/$(DIST)/windows
	mkdir -p dist/$(DIST)/darwin
	mkdir -p dist/$(DIST)/linux
	mkdir -p dist/$(DIST)/arm
	mkdir -p dist/$(DIST)/arm7
	env GOOS=linux   GOARCH=amd64         GOWORK=off go build -trimpath -o dist/$(DIST)/linux   ./...
	env GOOS=linux   GOARCH=arm64         GOWORK=off go build -trimpath -o dist/$(DIST)/arm     ./...
	env GOOS=linux   GOARCH=arm   GOARM=7 GOWORK=off go build -trimpath -o dist/$(DIST)/arm7    ./...
	env GOOS=darwin  GOARCH=amd64         GOWORK=off go build -trimpath -o dist/$(DIST)/darwin  ./...
	env GOOS=windows GOARCH=amd64         GOWORK=off go build -trimpath -o dist/$(DIST)/windows ./...

release: update-release build-all
	find . -name ".DS_Store" -delete
	tar --directory=dist --exclude=".DS_Store" -cvzf dist/$(DIST).tar.gz $(DIST)

debug: build
	$(CMD) run --console

godoc:
	godoc -http=:80	-index_interval=60s

version: build
	$(CMD) version

help: build
	$(CMD) help
	$(CMD) help commands
	$(CMD) help version
	$(CMD) help config
	$(CMD) help help
	$(CMD) help run
	$(CMD) help daemonize
	$(CMD) help undaemonize

config: build
	$(CMD) config

daemonize: build
	sudo $(CMD) daemonize

undaemonize: build
	sudo $(CMD) undaemonize

run: build
	$(CMD) --console

swagger: 
	docker run --detach --publish 80:8080 --rm swaggerapi/swagger-editor 
	open http://127.0.0.1:80


