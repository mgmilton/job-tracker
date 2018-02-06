require "rails_helper"

describe "User creates a new comment" do
  scenario "a user can add comments" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "Sports")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category)

    visit company_job_path(company, job)

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job.id}")

    fill_in "comment[content]", with: "what a lovely job!"
    click_on "Create Comment"

    expect(page).to have_content("what a lovely job!")

    fill_in "comment[content]", with: "what a miserable interview"
    click_on "Create Comment"

    expect(current_path).to eq("/jobs/#{job.id}")
    expect(page).to have_content("what a miserable interview")
  end
end
