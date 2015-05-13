Given(/^a university called "(.*?)" exists$/) do |university_name|
  university = University.create({name: university_name})
  expect(university).to be_valid
end

When(/^I associate myself with "(.*?)"$/) do |university_name|
  university = University.where({name: university_name}).first
  expect(university).to_not be_nil

  click_on "join-#{university.id}"
end
