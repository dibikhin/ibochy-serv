module RestApp
  module Services
    class StaffService
      include RestApp::Infra::Repo

      def initialize(staff_repo)
        @repo = staff_repo # @repo defined in Infra::Repo
      end
    end
  end
end