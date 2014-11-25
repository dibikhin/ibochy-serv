module RestApp
  module Controllers
    class TemplateController < CrudController
      def initialize(service)
        super(service)
      end

      get '/test' do
        '<a href="/templates">/templates</a>'
      end
    end
  end
end