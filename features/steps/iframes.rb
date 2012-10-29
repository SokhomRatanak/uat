# TODO ct 2012-10-30 Proof of concept for iframe tests
Then /^iframe "(.*?)" should include "(.*?)"$/ do |element, content|
  sleep 3

  within_frame element do
    page.body.should include(content)
  end
end
