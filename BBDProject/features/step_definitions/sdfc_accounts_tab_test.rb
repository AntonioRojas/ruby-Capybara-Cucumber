def print_account_table()
  page.has_xpath?("//*[@id='ext-gen12']/div")

  puts "-------------print table using xpath page.all-------------"
  page.all(:xpath, "//*[@id='ext-gen12']/div").each do |div_selector|
    div_selector.all(:xpath, "table/tbody/tr/td[4]").each do |td|
      puts td.text
    end
  end
  #index in order to access to tabel rows
  #row = 2
  #accessing to account name #4
  #page.all(:xpath, "//*[@id='ext-gen12']/div[#{row}]/table/tbody/tr/td[4]").each do |td|
    #puts td.text
  #end
end

Given /^I am on the SFDC page$/ do
  $max_time = 20
  CapybaraEnvConfiguration.environment_configuration("https://login.salesforce.com")
  visit ('/')
  find(:css, '#username').click.set("xxxxx")
  find(:css, '#password').click.set("xxxxx")
  find(:xpath,'//*[@id="Login"]').click
  sleep($load_page_wait_time)
end

Given(/^user is on Classic view$/) do
  page.has_selector?('#phHeaderLogoImage')
end

When(/^user clicks on Account tab$/) do
  find(:css, '#Account_Tab').click
end

And(/^user selects "([^"]*)" view$/) do |view|
  find(:css,'#fcf').click.set(view).click
  find(:css,'#filter_element > div > span > span.fBody > input').click
end

Then(/^Accounts should be listed$/) do
  sleep($load_page_wait_time)
  find(:xpath,'//*[@id="ext-gen16"]/div/table')
  print_account_table()
end