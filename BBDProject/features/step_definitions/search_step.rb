Given /^I am on the main google search$/ do
  visit ('/')
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^I click search button$/ do
  #In case you want ot use xpath
  #find(:xpath, "//button[@name='btnG']").click()
  click_button('Search')
end

When /^I click on the first result$/ do
  find(:xpath, "//html/body//div[3]/div/div[1]/div/h3/a").click
end

Then /^I should see "([^"]*)"$/ do |text|
  page.has_text? text
end