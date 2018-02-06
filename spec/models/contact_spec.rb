require "rails_helper"

describe Contact, type: :model do
  describe "validations" do
    it "is invalid without a full name" do
      contact = Contact.new(position: "Janitor", email: "stinkremover@google.com")
      expect(contact).to be_invalid
    end

    it "is invalid without a position" do
      contact = Contact.new(full_name: "Rusty Snagletooth", email: "stinkremover@google.com")
      expect(contact).to be_invalid
    end

    it "is invalid without an email" do
      contact = Contact.new(full_name: "Rusty Snagletooth", position: "Janitor")
      expect(contact).to be_invalid
    end

    it "is valid with a full name, position, and email" do
      company = Company.new(name: "Google")
      contact = Contact.new(full_name: "Rusty Snagletooth", position: "Janitor", email: "stinkremover@google.com", company: company)
      expect(contact).to be_valid
    end

    describe "relationships" do
      it {should belong_to(:company)}
    end
  end
end
