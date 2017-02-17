require 'capybara'
require 'capybara/cucumber'

Capybara.default_driver = :selenium
Capybara.app_host = "http://www.google.com"
Capybara.default_max_wait_time = 20

class CapybaraDriverRegistrar
  # register a Selenium driver for the given browser to run on the localhost
  def self.register_selenium_driver(browser)
    Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(app, :browser => browser)
    end
  end

end
CapybaraDriverRegistrar.register_selenium_driver(:chrome)
# In case you want ot use firefox, remember to copy geckodriver in your system path
#CapybaraDriverRegistrar.register_selenium_driver(:firefox)
Capybara.run_server = false
World(Capybara)