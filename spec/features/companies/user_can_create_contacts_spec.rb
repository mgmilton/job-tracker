require "rails_helper"

describe "User creates a contact" do
  scenario "a user can add contacts" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "Sports")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category)

    visit company_path(company)
    expect(current_path).to eq("/companies/#{company.id}")

    fill_in "contact[full_name]", with: "Zach Lowe"
    fill_in "contact[position]", with: "Basketball Savant"
    fill_in "contact[email]", with: "zach@espn.com"
    click_on "Create Contact"


    fill_in "contact[full_name]", with: "Scott Van Pelt"
    fill_in "contact[position]", with: "SportsCenter Host"
    fill_in "contact[email]", with: "scottrulez@espn.com"
    click_on "Create Contact"

    expect(current_path).to eq("/companies/#{company.id}")
    expect(page).to have_content("Zach Lowe")
    expect(page).to have_content("Basketball Savant")
    expect(page).to have_content("zach@espn.com")
    expect(page).to have_content("Scott Van Pelt")
    expect(page).to have_content("SportsCenter Host")
    expect(page).to have_content("scottrulez@espn.com")
  end
end
