require 'sinatra'
require 'rack/test'
require 'active_support/inflector'

#TODO remove hardcode
require File.join(File.dirname(__FILE__), '..', '..', 'test/test')
require File.join(File.dirname(__FILE__), '..', '..', 'web/web')

# TODO organize
def de_json(obj)
  MultiJson.load(obj)
end

def fill_item(table)
  table.hashes.each_with_object({}) do |row, hash|
    name, value, type = row['attribute'], row['value'], row['type']
    hash[name.tr(' ', '_').camelize(:lower)] = value.to_type(type.constantize)
  end
end

ActiveSupport::Inflector.inflections do |inflect|
  inflect.uncountable 'staff'
end

module WebAppWorld
  def app
    Rack::Builder.new do
      map '/templates' do
        run RestApp::Controllers::TemplateController.new(
                RestAppTest::ServiceStubs::TemplateServiceStub.new)
      end

      map '/staff' do
        run RestApp::Controllers::StaffController.new(
                RestAppTest::ServiceStubs::StaffServiceStub.new,
                RestAppTest::ServiceStubs::AuthServiceStub.new)
      end

      map '/authors' do
        run RestApp::Controllers::AuthorController.new(
                RestAppTest::ServiceStubs::AuthorServiceStub.new,
                RestAppTest::ServiceStubs::HumanAuthServiceStub.new)
      end

      map '/layouts' do
        run RestApp::Controllers::LayoutController.new(
                RestAppTest::ServiceStubs::LayoutServiceStub.new)
      end
    end
  end
end

World(WebAppWorld, Rack::Test::Methods)