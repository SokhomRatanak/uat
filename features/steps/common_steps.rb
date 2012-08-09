Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
  [404,500,403].should_not include(page.status_code)
end

When /^(?:|I )go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )press "([^"]*)"(?: within "([^"]*)")?$/ do |button, selector|
  with_scope(selector) do
    click_button(button)
  end
end

When /^(?:|I )follow "([^"]*)"(?: within "([^"]*)")?$/ do |link, selector|
  with_scope(selector) do
    click_link(link)
  end
end

When /^(?:|I )click link with xpath "([^"]*)"(?: within "([^"]*)")?$/ do |xpath, selector|
  with_scope(selector) do
    find(:xpath, xpath).click
  end
end

Then /^(?:|I )should see JSON:$/ do |expected_json|
  require 'json'
  expected = JSON.pretty_generate(JSON.parse(expected_json))
  actual   = JSON.pretty_generate(JSON.parse(response.body))
  expected.should == actual
end

Then /^(?:|I )should see "([^"]*)"(?: within "([^"]*)")?$/ do |text, selector|
  with_scope(selector) do
    page.should have_content(text)
  end
end

Then /^(?:|I )should see \/([^\/]*)\/(?: within "([^"]*)")?$/ do |regexp, selector|
  regexp = Regexp.new(regexp)
  with_scope(selector) do
    page.should have_xpath('//*', :text => regexp)
  end
end


Then /^(?:|I )should see xpath "([^"]*)"(?: within "([^"]*)")?$/ do |regexp, selector|
  with_scope(selector) do
    page.should have_xpath(regexp)
  end
end


Then /^(?:|I )should not see "([^"]*)"(?: within "([^"]*)")?$/ do |text, selector|
  with_scope(selector) do
    page.should have_no_content(text)
  end
end

Then /^(?:|I )should not see \/([^\/]*)\/(?: within "([^"]*)")?$/ do |regexp, selector|
  regexp = Regexp.new(regexp)
  with_scope(selector) do
    page.should have_no_xpath('//*', :text => regexp)
  end
end

Then /^(?:|I )should not see xpath "([^"]*)"(?: within "([^"]*)")?$/ do |regexp, selector|
#  regexp = Regexp.new(regexp)
  with_scope(selector) do
    page.should have_no_xpath(regexp)
  end
end

Then /^(?:|I )should be on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
    current_path.should == path_to(page_name)
end

Then /^(?:|I )should have the following query string:$/ do |expected_pairs|
  query = URI.parse(current_url).query
  actual_params = query ? CGI.parse(query) : {}
  expected_params = {}
  expected_pairs.rows_hash.each_pair{|k,v| expected_params[k] = v.split(',')}

  actual_params.should == expected_params
end
end

Then /^show me the page$/ do
  save_and_open_page
end

Given /^PENDING/ do
  pending
end

Given /^(?:|I )open website (.+)$/ do |url|
  visit url
end

When /^I click on image "([^"]*)"$/ do |arg1|
  find("##{arg1}").click
end

When /^I click on element "([^"]*)"$/ do |arg1|
  find("#{arg1}").click
end

Then /^I should see a date within "([^"]*)"$/ do |selector|
  with_scope(selector) do
    page.text.should match(/(\d{2})\.(\d{2})\.(\d{4})/)
  end
end

Then /^I wait for (\d+) seconds*$/ do |seconds|
  sleep seconds.to_i
end

Then /^the element "([^"]*)" should be visible$/ do |element|
   page.evaluate_script("jQuery('#{selector_for(element)}').is(':visible')").should be_true
end

Then /^the element "([^"]*)" should not be visible$/ do |element|
   page.evaluate_script("jQuery('#{selector_for(element)}').is(':visible')").should be_false
end

Given /^I hover over the "([^"]*)"$/ do |element|
  element = selector_for(element)
  page.execute_script("jQuery('#{element}').trigger('mouseenter')")
end

Given /^I am logged in$/ do
  page.driver.browser.credentials = "user:pw"
end

When /^I click on the element "([^"]*)"$/ do |element|
  element = find(element)
  element.click
end

Then /^I should have (?:at least )?"(\d) ([^"]*)" within "([^"]*)"$/ do |number_of_elements, selector, parent|
  with_scope(parent) do
    elements = all(selector_for(selector))
    elements.size.should >= number_of_elements.to_i
  end
end

