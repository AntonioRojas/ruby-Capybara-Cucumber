require 'capybara'
require 'capybara/cucumber'

$max_time = 5

class CapybaraEnvConfiguration
  def self.environment_configuration(host)
    Capybara.default_driver = :selenium
    Capybara.app_host = host
    Capybara.default_max_wait_time = $max_time
  end
end

class CapybaraDriverRegister
  # register a Selenium driver for the given browser to run on the localhost
  def self.register_selenium_driver(browser)
    Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(app, :browser => browser)
    end
  end

end

CapybaraDriverRegister.register_selenium_driver(:chrome)
# In case you want ot use firefox, remember to copy geckodriver in your system path
#CapybaraDriverRegistrar.register_selenium_driver(:firefox)
Capybara.run_server = false
