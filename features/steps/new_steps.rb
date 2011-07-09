When /^I click on image "([^"]*)"$/ do |arg1|
  find("##{arg1}").click
end

Wenn /^ich das Bild "([^"]*)" anklicke$/ do |arg1|
  find("##{arg1}").click
end

Then /^I should see a date within "([^"]*)"$/ do |selector|
  with_scope(selector) do
      page.text.should match(/(\d{2})\.(\d{2})\.(\d{4})/)
  end
end

Given /^I am logged in$/ do
  page.driver.browser.credentials = "user:pw"
end

Given /^I am a developer$/ do
  find("##{arg1}").click
end

Given /^I am thirty$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see a bar$/ do
  pending # express the regexp above with the code you wish you had
end
