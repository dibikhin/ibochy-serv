module RestAppTest
  module ServiceStubs
    class TemplateServiceStub # TODO generate stub on the fly due to templates_crud.feature
      @@templates = [{
                         name: 'Cafe',
                         thumbnail: '8d7f6e5a4a',
                         body: '<html> head </body>'
                     },
                     {
                         name: 'School',
                         thumbnail: 'e73df3242f2a32a34',
                         body: '<html> bla-bla-bla </body>'
                     }]

      private
      def find_template(name)
        @@templates.detect { |t| t[:name].downcase.tr(' ', '-') == name } # TODO WARNING ".downcase.tr(' ', '-')"
      end

      def find_all_templates
        @@templates
      end

      public
      def new
        {name: '', thumbnail: '', body: ''}
      end

      def find_all
        find_all_templates
      end

      def create_and_save(params)
        params
      end

      def find(name)
        find_template(name)
      end

      def find_and_update(name, new_attrs)
        t = find_template(name)
        true unless t.nil?
      end

      def delete(name)
        t = find_template(name)
        true unless t.nil?
      end
    end
  end
end
