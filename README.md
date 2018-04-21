protoc --plugin=protoc-gen-grpc="$(command -v grpc_ruby_plugin)" --ruby_out=lib --grpc_out=lib trinket.proto
