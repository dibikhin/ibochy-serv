module RestApp
  module Controllers
    class AuthorController < CrudController
      extend RestApp::HumanAuth

      def initialize(crud_service, human_auth_service)
        super(crud_service)
        @human_auth_service = human_auth_service
      end

      self.mixin_human_auth

      get '/test' do
        '<a href="/authors">/authors</a>'
      end
    end
  end
end