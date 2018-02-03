require "rails_helper"

describe "user edits an existing job" do
  scenario "a user can edit a job" do
    company = Company.create!(name: "Random House")
    job = company.jobs.create!(title: "Publisher", description: "Paper Pusher", level_of_interest: 99, city: "New York")

    visit company_job_path(company, job)

    expect(page).to have_content("Random House")
    expect(page).to have_content("Publisher")
    expect(page).to have_content("99")

    click_link "Edit Job"
    expect(current_path).to eq(edit_company_job_path(company, job))
    fill_in "job[title]", with: "Copy Editor"
    fill_in "job[description]", with: "The Boss of Grammar"
    fill_in "job[level_of_interest]", with: 70
    fill_in "job[city]", with: "Oakland"
    
    click_button "Update Job"

    expect(page).to have_content("Copy Editor")
    expect(page).to_not have_content("Publisher")
    expect(page).to have_content("The Boss of Grammar")
    expect(page).to_not have_content("Paper Pusher")
    expect(page).to have_content("70")
    expect(page).to_not have_content("99")
    expect(page).to have_content("Oakland")
    expect(page).to_not have_content("New York")
  end
end
