module AuthHelper
    class << self
        def decoded_token(auth_header)
            if auth_header
                token = auth_header.split(' ')[1]
                begin
                    JWT.decode(token, APP_CONFIG['jwt_secret'], true, algorithm: 'HS256')
                rescue JWT::ExpiredSignature
                     nil
                rescue JWT::DecodeError
                     nil
                end
            end
        end
    end
end