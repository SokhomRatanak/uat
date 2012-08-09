Then /^I take a screenshot$/ do
  # The class variables are set in support/hooks.rb
  counter   = @screenshot_counter.to_s.rjust(2, '0')
  file_name = @scenario.name.downcase.tr(" ", "_").gsub(/[^\w_\.\-]+/,"")

  page.driver.render("screenshot_#{file_name}_#{counter}.png", :full => true)
  # @see https://github.com/mattheworiordan/capybara-screenshot
#  Capybara::Screenshot.screen_shot_and_save_page
  @screenshot_counter += 1
end

Then /^show me the page$/ do
  save_and_open_page
end

