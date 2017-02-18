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
  within_table('customers') do
    all(:xpath, "tbody/tr/td").each do |td|
      if td.text == client
        puts "client > " + td.text + " found on table"
      end
    end
  end
end

Given(/^I am on the "([^"]*)" page$/) do |host|
  $max_time = 20
  CapybaraEnvConfiguration.environment_configuration(host)
  visit('/html/html_tables.asp')
end

Then(/^I should see "([^"]*)" title and print table:$/) do |table_title|
  expect(page).to have_content table_title
  print_html_table()
end

And(/^I should see the following report in the "([^"]*)" column:$/) do |column, table|
  puts "Input from BBD: " + table.raw.length.to_s
  puts "Data from BBD" + table.raw.to_s
  table.raw.each do |key, value|
    puts "search for company " + column.to_s + " column: " + key
    find_customer(key)
  end
end