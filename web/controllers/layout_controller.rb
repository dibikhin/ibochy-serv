module RestApp
  module Controllers
    class LayoutController < CrudController
      def initialize(crud_service)
        super(crud_service)
      end

      get '/test' do
        '<a href="/layouts">/layouts</a>'
      end
    end
  end
end