Given(/^I fill in email with (.*)$/) do |email|
  @loginScreen = LoginScreen.new
  @loginScreen.email.send_keys email
end

And(/^I fill in password with (.*)$/) do |password|
  @loginScreen.password.send_keys password, :enter
end

And /^I press sign in button$/ do
  @loginScreen.signin_button.click
  sleep 3
end

Then(/^Alert will show error "([^"]*)"$/) do |expected|
  @loginScreen.wait_for_alert_view(3)
  expect(@loginScreen.alert_view.value).to eq expected.to_s
end

Then(/^I see welcome view appear$/) do
  @welcome_screen = WelcomeScreen.new
  @welcome_screen.wait_until_welcome_label_visible(3)
end