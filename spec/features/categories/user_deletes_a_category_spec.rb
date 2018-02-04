require "rails_helper"

describe "user can delete an exisiting category" do
  scenario "a user can delete a category" do
    category = Category.create!(title: "Publishing")

    visit categories_path

    click_link "Delete"

    expect(current_path).to eq(categories_path)
    expect(page).to have_content("#{category.title} was successfully deleted")
    expect(page).to have_content("All Categories")
  end
end
