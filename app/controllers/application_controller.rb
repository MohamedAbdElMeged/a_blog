class ApplicationController < ActionController::API
    def auth_header
        request.headers["authorization"].split(' ')[1]   
    end
    def logged_in_user
        puts "mego     " + auth_header
        @user = GrpcUserHelper.grpc_user_get_by_token(auth_header)
        @user ? @user : head(:unauthorized)
    end
    def logged_in?
        !!logged_in_user  
      end
    
      def authorized
        render json: { message: 'Please log in' }, status: :unauthorized unless  logged_in? 
      end
end
