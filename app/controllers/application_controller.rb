class ApplicationController < ActionController::API
    def auth_header
        request.headers["authorization"]    
    end
    def logged_in_user
        if AuthHelper.decoded_token(auth_header)
            @user = AuthHelper.decoded_token(auth_header)[0]['user']
             
        else
            head(:unauthorized)
        end
    end
    def logged_in?
        !!logged_in_user  
      end
    
      def authorized
        render json: { message: 'Please log in' }, status: :unauthorized unless  logged_in? 
      end
end
