require "rails_helper"

describe Category, type: :model do
  describe "validations" do
    it "is invalid without a title" do
      category = Category.new()
      expect(category).to be_invalid
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
