Given("the following user exists") do |table|
    table.hashes.each do |user|
        FactoryBot.create(:user, user)
    end
end

Given("a user exists") do
    FactoryBot.create(:user)
end

Given("I visit the landing page") do
    visit root_path
end

Given("I click {string}") do |element|
    click_on element
end

When("I fill in {string} field with {string}") do |element, value|
    fill_in element,with: value
end

Given("I am logged in as {string}") do |email|
    @user = User.find_by email: email
    login_as @user, scope: :user
    visit root_path
end

Given("The following cars exist") do |table|
    table.hashes.each do |car|
        user = User.find_or_create_by(first_name: car[:user])
        car.except!('user')
        Automobile.create(car.merge(user: user))
    end
end

Given("I click {string} within {string}") do |element, card|
    selected_card = card.split.first
    automobile = Automobile.find_by(brand: selected_card)
    dom_section = "#automobile_#{automobile.id}"
    within(dom_section) do
        click_on element
    end
end

Given("I attach an image to {string}") do |image|
    attach_file("#{image}_image", "#{::Rails.root}/spec/fixtures/dummy_image.jpg")
end

Given("I wait {int} seconds") do |int|
    sleep int
end

Given("I fill in the payment form") do
    card_no = '42'
    stripe_iframe = find("iframe[name='__privateStripeFrame4']", visible: false)
    within_frame stripe_iframe do
      card_field = find_field('cardnumber')
      card_field.native.clear
      8.times { sleep 0.1; card_field.send_keys(right: card_no); sleep 0.1; }
      
      find_field('exp-date').send_keys('1121')
      find_field('cvc').send_keys('123')
      find_field('postal').send_keys('11310')
    end
end

Given("I submit the payment form") do
    click_on 'Submit Payment'
end
  