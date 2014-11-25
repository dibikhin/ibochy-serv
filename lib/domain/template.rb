module RestApp
  module Domain
    class Template
      include Mongoid::Document
      include Mongoid::Timestamps

      field :name, type: String
      field :file, type: Moped::BSON::Binary
    end
  end
end