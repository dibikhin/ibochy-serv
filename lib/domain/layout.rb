module RestApp
  module Domain
    class Layout
      include Mongoid::Document
      include Mongoid::Timestamps

      field :name, type: String
    end
  end
end