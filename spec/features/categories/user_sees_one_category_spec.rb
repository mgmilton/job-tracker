require "rails_helper"

describe "User sees one category" do
  scenario "a user sees a category" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "Tech Support")
    company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver", category: category)

    visit category_path(category)

    expect(current_path).to eq("/categories/#{category.id}")
    expect(page).to have_content("Tech Support")
    expect(page).to have_content("Developer")
  end
end
