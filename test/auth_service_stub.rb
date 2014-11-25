module RestAppTest
  module ServiceStubs
    class AuthServiceStub
      def login
        'login ok'
      end

      def logout
        'logout ok'
      end
    end
  end
end