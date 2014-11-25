module RestApp
  module Services
    class LayoutService
      include RestApp::Infra::Repo

      def initialize(layout_repo)
        @repo = layout_repo # @repo defined in Infra::Repo
      end
    end
  end
end