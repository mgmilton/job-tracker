require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees a job for a specific company" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "Sports")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category)
    comment_1 = job.comments.create!(content: "this is my very special content")
    comment_2 = job.comments.create!(content: "sports are weird")
    visit company_job_path(company, job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("70")
    expect(page).to have_content("my very special content")
    expect(page).to have_content("sports are weird")
  end

  scenario "a user can add comments" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "Sports")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category)

    visit company_job_path(company, job)

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job.id}")

    fill_in "comment[content]", with: "what a lovely job!"
    click_on "Submit"

    expect(page).to have_content("what a lovely job!")

    fill_in "comment[content]", with: "what a miserable interview"
    click_on "Submit"

    expect(current_path).to eq("/jobs/#{job.id}")
    expect(page).to have_content("what a miserable interview")
  end
end
