module RestApp
  module JsonHelper
    def json(obj)
      MultiJson.dump(obj)
    end

	def de_json(obj)
      MultiJson.load(obj)
    end
  end

  module StatusHelper
    def created
      Rack::Utils::status_code(:created)
    end

	def bad_request
      Rack::Utils::status_code(:bad_request)
    end

    def unauthorized
      Rack::Utils::status_code(:unauthorized)
    end	
  end
end
