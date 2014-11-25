module RestAppTest
  module ServiceStubs
    class AuthorServiceStub

      # TODO ?-> Author<!Crud!>ServiceStub

      @@authors = [{
                       username: 'Sasha',
                       email: 'sasha@pussy.com'
                   },
                   {
                       username: 'Mary',
                       email: 'mary@dick.com'
                   }]

      private
      def find_author(username)
        @@authors.detect { |s| s[:username].downcase.tr(' ', '-') == username } # TODO WARNING ".downcase.tr(' ', '-')"
      end

      def find_all_authors
        @@authors
      end

      public
      def new
        {username: '', email: ''}
      end

      def find_all
        find_all_authors
      end

      def create_and_save(params)
        params
      end

      def find(username)
        find_author(username)
      end

      def find_and_update(username, new_attrs)
        true unless find_author(username).nil?
      end

      def delete(username)
        true unless find_author(username).nil?
      end
    end
  end
end