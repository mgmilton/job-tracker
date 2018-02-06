require 'rails_helper'

describe Company do
  describe "class methods" do
    describe "#top_three" do
      it "returns names of top three companies" do
      category = Category.create!(title: "Web Development")
      c1 = Company.create!(name: "Dropbox")
      c2 = Company.create!(name: "Samsung")
      c3 = Company.create!(name: "Apple")
      c4 = Company.create!(name: "Target")
      c1.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category)
      c1.jobs.create!(title: "Dev Ops", level_of_interest: 90, city: "Denver", category: category)
      c1.jobs.create!(title: "QA", level_of_interest: 95, city: "Denver", category: category)
      c2.jobs.create!(title: "Sales", level_of_interest: 3, city: "Denver", category: category)
      c3.jobs.create!(title: "Project Management", level_of_interest: 10, city: "Denver", category: category)



      expect(Company.top_three[0].name).to eq("Dropbox")
      expect(Company.top_three[1].name).to eq("Apple")
      expect(Company.top_three[2].name).to eq("Samsung")
      end
    end

    describe "#avg_job_interest" do
      it "returns the average level of interest for all jobs" do
        category = Category.create!(title: "Web Development")
        c1 = Company.create!(name: "Dropbox")
        c2 = Company.create!(name: "Samsung")
        c3 = Company.create!(name: "Apple")
        c1.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category)
        c1.jobs.create!(title: "Dev Ops", level_of_interest: 90, city: "Denver", category: category)
        c1.jobs.create!(title: "QA", level_of_interest: 95, city: "Denver", category: category)
        c2.jobs.create!(title: "Sales", level_of_interest: 3, city: "Denver", category: category)
        c3.jobs.create!(title: "Project Management", level_of_interest: 10, city: "Denver", category: category)

        expect(Company.avg_job_interest(c1.name)).to eq(85.0)
        expect(Company.avg_job_interest(c2.name)).to eq(3)
        expect(Company.avg_job_interest(c3.name)).to eq(10)
      end
    end
  end

  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        company = Company.new()
        expect(company).to be_invalid
      end

      it "has a unique name" do
        Company.create(name: "Dropbox")
        company = Company.new(name: "Dropbox")
        expect(company).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        company = Company.new(name: "Dropbox")
        expect(company).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many jobs" do
      company = Company.new(name: "Dropbox")
      expect(company).to respond_to(:jobs)
    end
  end
end
