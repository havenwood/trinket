# Trinket

## Install

```sh
bundle
```

## Generate Protos

```sh
grpc_tools_ruby_protoc --ruby_out=lib --grpc_out=lib trinket.proto
```

## Run the Server

```sh
bin/trinket_server
```

## Run the Client

```sh
bin/trinket_cliet
```
