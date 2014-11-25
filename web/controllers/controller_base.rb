module RestApp
  module Controllers
    class ControllerBase < Sinatra::Base
	  AuthToken = RestApp::Domain::AuthToken
      helpers RestApp::JsonHelper, RestApp::StatusHelper

	  def is_auth_token_valid?(request)
		if request.params.empty?
		  if !request.content_length.nil? && request.content_length.to_i > 0
		    auth_token = AuthToken.new(de_json(request.body.read))
		  else
			halt bad_request, json(developerMessage: '', userMessage: '', errorCode: 12345, more_info: 'http://')
		  end
		else
		  auth_token = AuthToken.new(request.params)
		end
		
		unless auth_token.is_valid?
		  halt bad_request, json(developerMessage: '', userMessage: '', errorCode: 12345, more_info: 'http://')
		end
	  end

      before do
        cache_control :private

		# CORS enabled 
		# http://thibaultdenizet.com/tutorial/cors-with-angular-js-and-sinatra/	
		content_type :json    
		headers 'Access-Control-Allow-Origin' => '*', 
				'Access-Control-Allow-Methods' => ['OPTIONS', 'GET', 'POST', 'PUT'],
				'Access-Control-Allow-Headers' => 'X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept'
				
		# just in case if smth...
		request.body.rewind
		
		is_auth_token_valid?(request) if !request.options? && (request.path =~ /^.*\/login$/).nil?	
      end

	  # for POST w/ CORS enabled; without '*' PUT does not work
	  options '*' do
        200
      end
    end
  end
end

# TODO configure '*' for dev/test/prod
# TODO ban all undefined verbs such as POST on /templates
# TODO draw 404 page
# TODO hide response guts 'Server: WEBrick/1.3.1 (Ruby/2.0.0/2014-05-08)'
# TODO find & use code contracts
# TODO development, production... shit. Refactor! add dev/test/prod to file and to heroku
# TODO @raw_params_validator.is_valid?(params)
# TODO create value object, 'value' gem?
# TODO validate name
# TODO 204 No Content