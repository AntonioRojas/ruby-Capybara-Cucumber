require 'rest_client'
require 'json'

class Rest_api
  @response_body
  @response_code
  def self.get_with_no_parameters (url)
    response = RestClient.get url
    @response_body = response.body
    @response_code = response.code
  end
  def self.get_with_parameters (url,parameters)
    response = RestClient.get url + "?" + parameters
    @response_body = response.body
    @response_code = response.code
  end
  def self.get_response_code
    return @response_code
  end
  def self.get_response_body_as_json
    begin
      result = JSON.parse(@response_body)
    rescue
      raise "No json format"
      result = nil
    end
    return result
  end
  def self.get_response_body
    return @response_body
  end
end

#examples
#Rest_api.get_with_no_parameters('http://ip.jsontest.com/')
#puts Rest_api.get_response_body_as_json["ip"]
#puts Rest_api.get_response_body_as_json.keys

#Rest_api.get_with_parameters('http://md5.jsontest.com/','text=example_text')
#puts Rest_api.get_response_body_as_json["md5"]
#puts Rest_api.get_response_body_as_json.keys

Given(/^I do a rest\-api call to "([^"]*)"$/) do |url|
  Rest_api.get_with_no_parameters(url)
end

Then(/^I should get the "([^"]*)" IP address as result$/) do |ip|
  puts Rest_api.get_response_body_as_json["ip"]
  if Rest_api.get_response_body_as_json["ip"].eql? ip
    puts "IP is the same"
  else
    raise "Wrong IP was generated"
  end
end