# frozen_string_literal: true

require 'rake/clean'

CLEAN.include 'lib/*_pb.rb'

task default: %w[generate]

task :generate do
  sh 'grpc_tools_ruby_protoc --ruby_out=lib --grpc_out=lib trinket.proto'
end

task :server do
  sh 'bin/trinket_server'
end

task :client do
  sh 'bin/trinket_client'
end
