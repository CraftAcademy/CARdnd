# frozen_string_literal: true

Given('the following user exists') do |table|
  table.hashes.each do |user|
    FactoryBot.create(:user, user)
  end
end

Given('a user exists') do
  FactoryBot.create(:user)
end

Given('I visit the landing page') do
  visit root_path
end

Given('I click {string}') do |element|
  click_on element
end

When('I fill in {string} field with {string}') do |element, value|
  fill_in element, with: value
end

Given('I am logged in as {string}') do |email|
  @user = User.find_by email: email
  login_as @user, scope: :user
  visit root_path
end

Given('(T/t)he following cars exist') do |table|
  table.hashes.each do |car|
    user = User.find_or_create_by(first_name: car[:user])
    car.except!('user')
    Automobile.create(car.merge(user: user))
  end
end

Given('I click on {string} for {string}') do |element_value, car_brand|
  car = Automobile.find_by_brand(car_brand)
  within "#automobile_#{car.id}" do
    click_on element_value
  end
end

And('stop') do
  binding.pry
end

Then('I fill in the payment form') do
  card_no = '42'
  stripe_iframe = find("iframe[name='__privateStripeFrame4']", visible: false)
  within_frame stripe_iframe do
    card_field = find_field('cardnumber')
    card_field.native.clear
    8.times { sleep 0.1; card_field.send_keys(right: card_no); sleep 0.1; }

    find_field('exp-date').send_keys('1221')
    find_field('cvc').send_keys('123')
    find_field('postal').send_keys('11310')
  end
end

Then('submit the payment form') do
  click_on 'Submit Payment'
end

Given('I wait {int} seconds') do |int|
  sleep int
end
