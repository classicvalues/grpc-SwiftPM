# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: src/proto/grpc/testing/worker_service.proto for package 'grpc.testing'
# Original file comments:
# Copyright 2015 gRPC authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# An integration test service that covers all the method signature permutations
# of unary/streaming requests/responses.

require 'grpc'
require 'src/proto/grpc/testing/worker_service_pb'

module Grpc
  module Testing
    module WorkerService
      class Service

        include GRPC::GenericService

        self.marshal_class_method = :encode
        self.unmarshal_class_method = :decode
        self.service_name = 'grpc.testing.WorkerService'

        # Start server with specified workload.
        # First request sent specifies the ServerConfig followed by ServerStatus
        # response. After that, a "Mark" can be sent anytime to request the latest
        # stats. Closing the stream will initiate shutdown of the test server
        # and once the shutdown has finished, the OK status is sent to terminate
        # this RPC.
        rpc :RunServer, stream(ServerArgs), stream(ServerStatus)
        # Start client with specified workload.
        # First request sent specifies the ClientConfig followed by ClientStatus
        # response. After that, a "Mark" can be sent anytime to request the latest
        # stats. Closing the stream will initiate shutdown of the test client
        # and once the shutdown has finished, the OK status is sent to terminate
        # this RPC.
        rpc :RunClient, stream(ClientArgs), stream(ClientStatus)
        # Just return the core count - unary call
        rpc :CoreCount, CoreRequest, CoreResponse
        # Quit this worker
        rpc :QuitWorker, Void, Void
      end

      Stub = Service.rpc_stub_class
    end
  end
end
