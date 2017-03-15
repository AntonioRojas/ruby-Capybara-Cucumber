Given /^I am on the login page SFDC page$/ do
  $max_time = 20
  CapybaraEnvConfiguration.environment_configuration("https://login.salesforce.com")
  visit ('/')
end

Given(/^user "([^"]*)" and password "([^"]*)"$/) do |user_email, password|
  browser = page.driver.browser
  #checking label UserName
  find(:xpath, '//*[@id="usernamegroup"]/label')
  #setting the email
  find(:css, '#username').click.set(user_email)
  #checking label Password
  find(:xpath, '//*[@id="login_form"]/label')
  #setting the value for password
  find(:css, '#password').click.set(password)

end

When(/^I press log in button$/) do
  #finding login button and click it
  find(:xpath,'//*[@id="Login"]').click
  #wating time
  sleep(load_page_wait_time)
end

Then(/^I should be able to enter to SDFC main page$/) do
  #checking if page logo is displayed
  page.has_selector?('#phHeaderLogoImage')
end

And(/^I should be able to see account information "([^"]*)" on SDFC page$/) do |user_name|
  #checking if user name is displayed
  page.has_selector?('#userNavLabel', :text => user_name)
end