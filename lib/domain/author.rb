module RestApp
  module Domain
    class Author
      include Mongoid::Document
      include Mongoid::Timestamps

      field :username, type: String
    end
  end
end