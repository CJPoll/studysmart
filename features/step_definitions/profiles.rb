Given(/^that I am logged in as "([^"]*)" "([^"]*)" with email "([^"]*)"$/) do |first_name, last_name, email|
  password = "password01"

  user = create_user(first_name, last_name, email, password)

  visit '/users/sign_in'
  fill_in 'user_email', :with => email
  fill_in 'user_password', :with => password
  click_button 'Log in'
end

Given(/^that I am not logged in$/) do
end

Given(/^there is a user named "([^"]*)" "([^"]*)"$/) do |first_name, last_name|
  create_user(first_name, last_name)
end

Given(/^there is a user named "([^"]*)" "([^"]*)" with email "([^"]*)"$/) do |first_name, last_name, email|
  create_user(first_name, last_name, email)
end

When(/^I visit profile "([^"]*)" "([^"]*)"$/) do |first_name, last_name|
  user = User.where({first_name: first_name, last_name: last_name}).first
  visit "/profiles/#{user.id}"
end

Then(/^I should see "([^"]*)" "([^"]*)" profile$/) do |first_name, last_name|
  user = User.where({first_name: first_name, last_name: last_name}).first
  expect(current_path).to eq "/profiles/#{user.id}"
end

Then(/^I should be on "([^"]*)"$/) do |path|
  expect(current_path).to eq path
end

private
def create_user first_name, last_name, email = "testemail@test.com", password = "password01"
  user = User.create!({
    first_name: first_name,
    last_name: last_name,
    email: email,
    password: password,
    password_confirmation: password
  })

  user
end
