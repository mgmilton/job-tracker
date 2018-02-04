require "rails_helper"

describe Comment, type: :model do
  describe "validations" do
    it "is invalid without content" do
      comment = Comment.new()
      expect(comment).to be_invalid
    end
  end

  describe "relationships" do
    it {should belong_to(:job)}
  end
end
