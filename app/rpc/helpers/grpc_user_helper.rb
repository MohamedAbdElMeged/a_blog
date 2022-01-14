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
                return result.user
                rescue GRPC::BadStatus => e
                return  "ERROR: #{e.message}"
                end
                
        end

        def grpc_user_get_by_token(token)
            #message = stub.say_hello(Helloworld::HelloRequest.new(name: user)).message
            hostname = 'localhost:50057'
            puts "grpc " + token
            stub =  Helloworld::Users::Stub.new(hostname,:this_channel_is_insecure)
            begin
                result = stub.get_user_by_token(Helloworld::GetUserByTokenRequest.new(token: token ))
                p "Greeting: #{result.user}"
                return result.user
            rescue GRPC::BadStatus => e
                return  "ERROR: #{e.message}"
            end
            
    end
    end
end