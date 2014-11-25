module RestApp
  module Auth
    def mixin_auth
      post '/login' do
        # authenticate_identity(request.params) if validated_identity(request.params)
        @auth_service.login
      end

      post '/logout' do
        # validated_api_key(request.params[:api_key])
        # forget_api_key
        @auth_service.logout
      end
    end
  end
end