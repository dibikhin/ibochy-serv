require 'sinatra'
require 'multi_json'
require 'mongoid'

# order may be important
require './lib/lib'
require './web/web'

module RestApp
  module Controllers
    class ControllerBase < Sinatra::Base
      configure do
        Mongoid.load!('mongoid.yml')
      end
    end
  end
end

map '/templates' do
  run RestApp::Controllers::TemplateController.new(
          RestApp::Services::TemplateService.new(RestApp::Domain::Template))
end

map '/staff' do
  run RestApp::Controllers::StaffController.new(
          RestApp::Services::StaffService.new(RestApp::Domain::Staff),
          RestApp::Services::AuthService.new)
end

map '/authors' do
  run RestApp::Controllers::AuthorController.new(
          RestApp::Services::AuthorService.new(RestApp::Domain::Author),
          RestApp::Services::HumanAuthService.new)
end

map '/layouts' do
  run RestApp::Controllers::LayoutController.new(
          RestApp::Services::LayoutService.new(RestApp::Domain::Layout))
end


# TODO SO it! C:\Ruby200-x64\bin\ruby.exe -e $stdout.sync=true;$stderr.sync=true;load($0=ARGV.shift)
# "C:/Users/Roman/My Projects/ibochy_serv/2_config.ru"
# "C:\Program Files (x86)\JetBrains\RubyMine 6.3.2\bin\runnerw.exe" C:\Ruby200-x64\bin\ruby.exe -e $stdout.sync=true;$stderr.sync=true;load($0=ARGV.shift)
# C:\Ruby200-x64\bin/rackup -o 127.0.0.1 -p 9292 config.ru
# TODO middleware fucks brain with unpredictable optional Sinatra::Wrapper on custom init of middleware

# TODO Bundler.require, create builder for this joins, remove dups