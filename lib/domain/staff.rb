module RestApp
  module Domain
    class Staff
      include Mongoid::Document
      include Mongoid::Timestamps

      field :name, type: String
    end
  end
end