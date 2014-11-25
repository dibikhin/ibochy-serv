# Quasicontroller
module RestApp
  module HumanAuth
    def mixin_human_auth
      post '/login' do
        # username=***** password=*****
        @human_auth_service.login
      end

      post '/signup' do
        # username=***** email=*****@*****.***** password=*****
        @human_auth_service.signup
      end

      post '/logout' do
        # api_key=*****
        @human_auth_service.logout
      end

      # TODO 'restore' -> 'restore password'
      post '/restore' do
        # email=*****@*****.*****
        @human_auth_service.restore
      end

      post '/suspend' do
        # api_key=*****
        @human_auth_service.suspend
      end
    end
  end
end