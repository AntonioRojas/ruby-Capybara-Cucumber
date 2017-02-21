require 'capybara'
require 'capybara/cucumber'

$max_time = 5

class CapybaraEnvConfiguration
  def self.environment_configuration(host)
    Capybara.default_driver = :selenium
    Capybara.app_host = host
    Capybara.default_max_wait_time = $max_time
    Capybara.run_server = false
    Capybara.current_session.windows[0].maximize
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
#registering with chrome
CapybaraDriverRegister.register_selenium_driver(:chrome)

# In case you want ot use firefox, remember to copy geckodriver in your system path
#CapybaraDriverRegistrar.register_selenium_driver(:firefox)

After do |scenario|
  # Do something after each scenario.
  # The +scenario+ argument is optional, but
  # if you use it, you can inspect status with
  # the #failed?, #passed? and #exception methods.

  if scenario.failed?
    Capybara.current_session.driver.quit
  end
end