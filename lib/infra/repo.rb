module RestApp
  module Infra
    module Repo
      def delete(name)
        record = @repo.where(name: name).first
        record.delete unless record.nil?
      end

      def find_and_update(id, new_attrs)
        record = @repo.find(id)
        record.update_attributes!(new_attrs) unless record.nil?
      end

      def find(name)
        @repo.where(name: name).first
      end

      def create_and_save(params)
        doc = @repo.new(params)
		doc.save!
		doc._id
      end

      def find_all
        @repo.each.to_a
      end

      def new
        @repo.new
      end
    end
  end
end