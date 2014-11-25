module RestApp
  module Domain 
    class AuthToken
	  def initialize(raw_auth_hash)
	    @session_key = raw_auth_hash['session_key']
	  end
		
	  def is_valid?
	    !(@session_key.nil? || @session_key.empty?)
      end
	end
  end
end