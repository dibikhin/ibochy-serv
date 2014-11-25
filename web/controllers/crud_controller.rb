module RestApp
  module Controllers
    class CrudController < ControllerBase
      def initialize(crud_service)
        super()
        @crud_service = crud_service
      end

      # note '?' for optional trailing '/'
      get '/?', provides: :json do
	    json @crud_service.find_all		
      end

      get '/new', provides: :json do
        json @crud_service.new
      end

      # note '?' for optional trailing '/'; it's here for test steps only
      post '/?' do
		  req_params = request.params		
		  file = req_params['file']
		  if file
		    filename = file[:filename]
		    tempfile = file[:tempfile]
			# {"session_key"=>"login ok", "model"=>"{\"name\":\"zxcv\"}", "file"=>{ ... } }
			model = de_json(req_params['model'])
			model['file'] = tempfile.read # dirty & ungly, throws Encoding::UndefinedConversionError on binary
			doc_id = @crud_service.create_and_save(model)
		    if doc_id
		      status created
			  json(_id: doc_id, developerMessage: '', userMessage: '', errorCode: 12345, more_info: 'http://')
			end
		  else
			# '{"session_key":"login ok","model":{"name":"zxcv","email":"asdf@ibochy.tk"}}'
			request.body.rewind
			doc_id = @crud_service.create_and_save(de_json(request.body.read)['model'])
		    if doc_id
			  status created
			  json(_id: doc_id, developerMessage: '', userMessage: '', errorCode: 12345, more_info: 'http://')
		    end
		  end
      end

      get '/:name', provides: :json do |name|
        json @crud_service.find(name)
      end

      get '/:name/edit', provides: :json do |name|
        json @crud_service.find(name)
      end

      put '/:id', provides: :json do |id|
		  req_params = request.params
		  file = req_params['file']
		  if file
		    filename = file[:filename]
		    tempfile = file[:tempfile]	  			
		    model = de_json(req_params['model'])
			model['file'] = tempfile.read # dirty & ungly, throws Encoding::UndefinedConversionError on binary
		    if @crud_service.find_and_update(id, model)
		      status created
		      json(developerMessage: '', userMessage: '', errorCode: 12345, more_info: 'http://')
		    else
		    end
		  else
			request.body.rewind
		    if @crud_service.find_and_update(id, de_json(request.body.read)['model'])
              status created
              json(developerMessage: '', userMessage: '', errorCode: 12345, more_info: 'http://')
            else
            end
		  end		
      end

      delete '/:name', provides: :json do |name|
        if @crud_service.delete(name)
          json(developerMessage: '', userMessage: '', errorCode: 12345, more_info: 'http://')
        else
        end
      end
    end
  end
end