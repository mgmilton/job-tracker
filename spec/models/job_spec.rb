require 'rails_helper'

describe Job do
  describe "class methods" do
    describe "#by_interest" do
      it "returns hash of jobs counted by interest in desecnding order" do
        category = Category.create!(title: "Web Development")
        c1 = Company.create!(name: "Dropbox")
        c1.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category)
        c1.jobs.create!(title: "Dev Ops", level_of_interest: 90, city: "Denver", category: category)
        c1.jobs.create!(title: "QA", level_of_interest: 90, city: "Denver", category: category)

        expect(Job.by_interest).to eq(90 => 2, 70 =>1)
      end
    end

    describe "#by_location" do
      it "returns hash of jobs counted by location in descending order" do
        category = Category.create!(title: "Web Development")
        c1 = Company.create!(name: "Dropbox")
        c1.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category)
        c1.jobs.create!(title: "Dev Ops", level_of_interest: 90, city: "Chicago", category: category)
        c1.jobs.create!(title: "QA", level_of_interest: 95, city: "Chicago", category: category)
        c1.jobs.create!(title: "QA", level_of_interest: 95, city: "Chicago", category: category)

        expect(Job.by_location).to eq("Chicago" => 3, "Denver"=> 1)
      end
    end
  end

  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        job = Job.new(level_of_interest: 80, description: "Wahoo", city: "Denver")
        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        job = Job.new(title: "Developer", description: "Wahoo", city: "Denver")
        expect(job).to be_invalid
      end

      it "is invalid without a city" do
        job = Job.new(title: "Developer", description: "Wahoo", level_of_interest: 80)
        expect(job).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title, level of interest, and company" do
        company = Company.new(name: "Turing")
        category = Category.new(title: "Mysticism")
        job = Job.new(title: "Developer", level_of_interest: 40, city: "Denver", company: company, category: category)
        expect(job).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")
      expect(job).to respond_to(:company)
    end

    it "belongs to a category" do
      category = Category.new(title: "Web Development")
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo", category: category)
      expect(job).to respond_to(:category)
    end

    it {should have_many(:comments)}
  end
end
