module RestAppTest
  module ServiceStubs
    class LayoutServiceStub
      @@layouts = [{
                       name: 'Cafe345'
                   },
                   {
                       name: 'School654'
                   }]

      private
      def find_layout(name)
        @@layouts.detect { |t| t[:name].downcase.tr(' ', '-') == name } # TODO WARNING ".downcase.tr(' ', '-')"
      end

      def find_all_layouts
        @@layouts
      end

      public
      # def new
      #   {name: ''}
      # end

      # def find_all
      #   find_all_layouts
      # end

      def create_and_save(params)
        params
      end

      def find(name)
        find_layout(name)
      end

      def find_and_update(name, new_attrs)
        t = find_layout(name)
        true unless t.nil?
      end

      # def delete(name)
      #   t = find_layout(name)
      #   true unless t.nil?
      # end
    end
  end
end
