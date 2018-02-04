require "rails_helper"

describe "User sees all categories" do
  scenario "a user sees all categories" do
    category = Category.create!(title: "Tech Support")
    category_2 = Category.create!(title: "Taxidermy")

    visit categories_path

    expect(page).to have_content("Tech Support")
    expect(page).to have_content("Taxidermy")
  end
end
