module RestApp
  module Services
    class TemplateService
      include RestApp::Infra::Repo

      def initialize(template_repo)
        @repo = template_repo # @repo defined in Infra::Repo
      end
    end
  end
end

# TODO zip namespaces? https://gist.github.com/jah2488/8938747