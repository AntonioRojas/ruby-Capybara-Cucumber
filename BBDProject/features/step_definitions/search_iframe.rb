Given(/^I am on the "([^"]*)" page with iframe example$/) do |host|
  $max_time = 20
  CapybaraEnvConfiguration.environment_configuration(host)
  visit('/iframeTest.html')
end

Then(/^I should see "([^"]*)" title in the "([^"]*)" iframe$/) do |text, iframe_name|
  browser = page.driver.browser
  find(:xpath, '/html/body/iframe[1]')
  browser.switch_to.frame(iframe_name)
    has_text? text
  browser.switch_to.default_content
end

And(/^I should be able to click on "([^"]*)" iframe the "([^"]*)" link$/) do |iframe_name, link|
  browser = page.driver.browser
  find(:xpath, '/html/body/iframe[2]')
  browser.switch_to.frame(iframe_name)
    click_link(link)
  browser.switch_to.default_content
end

And(/^go to "([^"]*)" iframe and check title "([^"]*)"$/) do |iframe_name, title|
  browser = page.driver.browser
  find(:xpath, '/html/body/iframe[3]')
  browser.switch_to.frame(iframe_name)
    expect(find(:xpath, '/html/body/h1')).to have_text(title)
  browser.switch_to.default_content
end