Then("I should see {string}") do |content|
    expect(page).to have_content content
end

Then("I should not see {string}") do |content|
    expect(page).to have_no_content content
end

Then("I should see {string} within {string}") do |content, car|
    selected_car = car.split.first
    automobile = Automobile.find_by(brand: selected_car)
    dom_section = "#automobile_#{automobile.id}"
    within(dom_section) do
        expect(page).to have_content(content)
    end
end

Then("Show me the page") do
    save_and_open_page
end

Then("I am on the show car page") do
    expect(current_path).to eq automobile_path(@automobile)
end
  