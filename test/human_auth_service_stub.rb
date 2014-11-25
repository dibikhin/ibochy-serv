module RestAppTest
  module ServiceStubs
    class HumanAuthServiceStub
      def login
        'login ok'
      end

      def signup
        'signup up'
      end

      def logout
        'logout ok'
      end

      def restore
        'restore ok'
      end

      def suspend
        'suspend ok'
      end
    end
  end
end