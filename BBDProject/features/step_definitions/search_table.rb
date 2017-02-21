
def print_html_table()
  page.has_xpath?("//table[@id='customers']")

  puts "-------------print table using xpath page.all-------------"
  page.all(:xpath, "//table[@id='customers']/tbody/tr/td").each do |td|
    puts td.text
  end

  puts "-------------print table using within-------------"
  within_table('customers') do
    all(:xpath, "tbody/tr/td").each do |td|
      puts td.text
    end
  end

  puts "-------------print table/tr using within-------------"
  within_table('customers') do
    all(:xpath, "tbody/tr").each do |tr|
      puts tr.text
    end
  end
end

def find_customer(client)
  count = 1
  found = false
  within_table('customers') do
    all(:xpath, "tbody/tr/td").each do |td|
      if ((td.text == client) && ((count - 1) % 3 == 0))
        found = true
        puts "client > " + td.text + " found on table: " + found.to_s
      end
      count +=1
    end
  end
  puts "count = " + count.to_s
  if !found
    raise "customer was not found on html table"
  end
end

Given(/^I am on the "([^"]*)" page with HTML example$/) do |host|
  $max_time = 20
  CapybaraEnvConfiguration.environment_configuration(host)
  visit('/html/html_tables.asp')
end

Then(/^I should see "([^"]*)" title and print table$/) do |table_title|
  expect(page).to have_content table_title
  print_html_table()
end

And(/^I should see the following customers in the "([^"]*)" column:$/) do |column, table|
  puts "Input from BBD: " + table.raw.length.to_s
  puts "Data from BBD" + table.raw.to_s
  table.raw.each do |key, value|
    puts "search for company " + column.to_s + " column: " + key
    find_customer(key)
  end
end