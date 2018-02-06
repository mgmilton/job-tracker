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


end
