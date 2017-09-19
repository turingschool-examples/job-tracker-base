require 'rails_helper'

describe JobTag do
  context "associations" do
    it "jobs have many tags" do
      company = Company.new(name: 'Dropbox')
      job = Job.new(title: "Developer", level_of_interest: 40, city: "Denver",
        company_id: company.id)

      expect(job.tags).to respond_to(:tag)
    end
  end
end