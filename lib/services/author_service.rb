module RestApp
  module Services
    class AuthorService
      include RestApp::Infra::Repo

      def initialize(author_repo)
        @repo = author_repo # @repo defined in Infra::Repo
      end
    end
  end
end