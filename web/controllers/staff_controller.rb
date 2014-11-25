module RestApp
  module Controllers
    class StaffController < CrudController
      extend RestApp::Auth

      def initialize(crud_service, auth_service)
        super(crud_service)
        @auth_service = auth_service
      end

      self.mixin_auth

      get '/test' do
        '<a href="/staff">/staff</a>'
      end
    end
  end
end