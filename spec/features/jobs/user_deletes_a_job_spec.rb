require "rails_helper"

describe "user can delete an existing job" do
  scenario "a user can delete a job" do
    company = Company.create!(name: "Random House")
    category = Category.create!(title: "Publishing")
    job = company.jobs.create!(title: "Publisher", description: "Paper Pusher", level_of_interest: 99, city: "New York", category: category)
    job_2 = company.jobs.create!(title: "Designer", description: "Creator of Book Covers", level_of_interest: 4, city: "New York", category: category)

    visit company_job_path(company, job)

    expect(page).to have_content("Random House")
    expect(page).to have_content("Publisher")
    expect(page).to have_content("99")

    click_link "Delete Job"

    
    expect(page).to have_content("Random House")
    expect(page).to have_content("Publisher was successfully deleted")
    expect(page).to_not have_content("99")
    expect(page).to have_content("Designer")
  end
end
