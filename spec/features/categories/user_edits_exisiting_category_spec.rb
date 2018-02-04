require "rails_helper"

describe "User edits existing category" do
  scenario "a user can edit a category" do
    company = Company.create!(name: "Scripps Institute")
    category = Category.create!(title: "Technician")
    job = company.jobs.create!(title: "Marine Biologist", description: "Whale Counter", level_of_interest: 99, city: "San Diego", category: category)

    visit edit_category_path(category)

    fill_in "category[title]", with: "Researcher"
    click_button "Update"

    expect(current_path).to eq("/categories/#{Category.last.id}")
    expect(page).to have_content("Researcher")
    expect(page).to_not have_content("Technican")
    expect(page).to have_content("Marine Biologist")
  end
end
