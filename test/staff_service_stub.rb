module RestAppTest
  module ServiceStubs
    class StaffServiceStub # TODO generate stub on the fly due to templates_crud.feature
      @@staff = [{
                         name: 'ali-ahmed',
                         email: 'ali@ibochy.tk'
                     },
                     {
                         name: 'nurshi',
                         email: 'nurshi@ibochy.tk'
                     }]

      private
      def find_staff(name)
        @@staff.detect { |s| s[:name].downcase.tr(' ', '-') == name } # TODO WARNING ".downcase.tr(' ', '-')"
      end

      def find_all_staff
        @@staff
      end

      public
      def new
        {name: '', email: ''}
      end

      def find_all
        find_all_staff
      end

      def create_and_save(params)
        params
      end

      def find(name)
        find_staff(name)
      end

      def find_and_update(name, new_attrs)
        true unless find_staff(name).nil?
      end

      def delete(name)
        true unless find_staff(name).nil?
      end
    end
  end
end
