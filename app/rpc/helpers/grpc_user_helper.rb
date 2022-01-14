require 'grpc'
require_relative '../pubs/users_services_pb'
module GrpcUserHelper
    class << self
        def grpc_user_get(id)
                #message = stub.say_hello(Helloworld::HelloRequest.new(name: user)).message
                hostname = 'localhost:50057'
                stub =  Helloworld::Users::Stub.new(hostname,:this_channel_is_insecure)
                begin
                result = stub.get_user_by_id(Helloworld::GetUserRequest.new(id: id ))
                p "Greeting: #{result}"
                return result
                rescue GRPC::BadStatus => e
                abort "ERROR: #{e.message}"
                end
                
        end

    end
end