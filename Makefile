#update path
PATH := $(PATH):$(GOPATH)/bin
GOROOT := $(GOROOT)
GOPATH := $(GOPATH)

.PHONY: INFO
info-run:
	@echo "PATH:"
	@echo $(PATH)
	@echo "GoROOT:"
	@echo $(GOROOT)
	@echo "GoPATH:"
	@echo $(GOPATH)

.PHONY: RUN
run: go-dep install-tools buf-generate

.PHONY: dependency
go-dep:
	go mod download

.PHONY: install-tools
install-tools:
	go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.28
	go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.2.0

.PHONY: grpc-gen
buf-generate:
	buf generate
