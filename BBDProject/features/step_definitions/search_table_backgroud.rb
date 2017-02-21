$main_page = "https://www.w3schools.com"

def find_all_info_customer(customer, contact, country)
  count = 1
  found = false
  within_table('customers') do
    all(:xpath, "tbody/tr").each do |tr|
      if (tr.text.include? customer) && (tr.text.include? contact) && (tr.text.include? country)
        found = true
        puts customer + " " + contact + " " +  country + " " + found.to_s
      end
    end
  end
  if !found
    raise "customer was not found on html table"
  end
end


Given(/^I am on the main page HTML course$/) do
  $max_time = 20
  CapybaraEnvConfiguration.environment_configuration($main_page)
  visit('/html/default.asp')
end

And(/^I should have the customers information in the columns:$/) do |table|
  table.raw.each do |customer, contact, country|
    find_all_info_customer(customer, contact, country)
  end
end