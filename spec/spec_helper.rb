require 'spec_helper'
require 'capybara/rspec'

require_relative '../config/application.rb'

RSpec.configure do |config|

  config.mock_with :rspec
  config.expect_with :rspec
  config.color_enabled = true
  config.formatter = :documentation
  config.order = 'random'

end


Capybara.configure do |config|
  config.app = MyApi::UserApiV1.new
  config.server_port = 9293
end