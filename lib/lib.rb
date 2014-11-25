# order is important
require File.join(File.dirname(__FILE__), 'infra/repo')

require File.join(File.dirname(__FILE__), 'domain/auth_token')

require File.join(File.dirname(__FILE__), 'services/auth_service')
require File.join(File.dirname(__FILE__), 'services/human_auth_service')

require File.join(File.dirname(__FILE__), 'domain/layout')
require File.join(File.dirname(__FILE__), 'services/layout_service')

require File.join(File.dirname(__FILE__), 'domain/template')
require File.join(File.dirname(__FILE__), 'services/template_service')

require File.join(File.dirname(__FILE__), 'domain/staff')
require File.join(File.dirname(__FILE__), 'services/staff_service')

require File.join(File.dirname(__FILE__), 'domain/author')
require File.join(File.dirname(__FILE__), 'services/author_service')