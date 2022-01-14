# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: users.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("users.proto", :syntax => :proto3) do
    add_message "helloworld.GetUserRequest" do
      optional :id, :int32, 1
    end
    add_message "helloworld.GetUserByTokenRequest" do
      optional :token, :string, 1
    end
    add_message "helloworld.GetUserReply" do
      optional :status, :string, 1
      oneof :data do
        optional :user, :message, 2, "helloworld.User"
        optional :error, :message, 3, "helloworld.Error"
      end
    end
    add_message "helloworld.User" do
      optional :email, :string, 1
      optional :name, :string, 2
      optional :id, :int32, 3
    end
    add_message "helloworld.Error" do
      optional :message, :string, 1
    end
  end
end

module Helloworld
  GetUserRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helloworld.GetUserRequest").msgclass
  GetUserByTokenRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helloworld.GetUserByTokenRequest").msgclass
  GetUserReply = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helloworld.GetUserReply").msgclass
  User = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helloworld.User").msgclass
  Error = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("helloworld.Error").msgclass
end
