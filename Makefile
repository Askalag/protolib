#update path
GOROOT := $(GOROOT)
GOPATH ?= $(shell go env GOPATH)
PATH := $(PATH):$(GOPATH)/bin

run: go-dep install-tools buf-generate
	go version

go-dep:
	go mod download

install-tools:
	go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.28
	go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.2.0

install-buf:
	# Substitute GOBIN for your bin directory
    # Leave unset to default to $GOPATH/bin
    GO111MODULE=on GOBIN=/usr/local/bin go install \
      github.com/bufbuild/buf/cmd/buf@v1.4.0

buf-generate:
	buf generate
