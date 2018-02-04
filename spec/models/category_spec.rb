require "rails_helper"

describe Category, type: :model do
  describe "validations" do
    it "is invalid without a title" do
      category = Category.new()
      expect(category).to be_invalid
    end

    it "is invalid without a unique title" do
      category = Category.create!(title: "Finance")
      category_2 = Category.new(title: "Finance")
      expect(category_2).to be_invalid
    end

    it "is valid with a title" do
      category = Category.new(title: "Web Development")
      expect(category).to be_valid
    end
  end

  describe "relationships" do
    it {is_expected.to have_many(:jobs)}
  end
end
