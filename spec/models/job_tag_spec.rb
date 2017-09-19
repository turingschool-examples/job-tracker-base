require 'rails_helper'

describe JobTag do
  context "associations" do
    it "jobs have many tags" do
      company = Company.create(name: 'Dropbox')
      job = Job.create(title: "Developer", level_of_interest: 40, city: "Denver",
        company_id: company.id)
      tag = Tag.create(title: 'Cloud Storage')

      job.tags << tag

      expect(job.tags.first).to eq(tag)
    end

    it "tags have many jobs" do
      company = Company.create(name: 'Dropbox')
      job = Job.create(title: "Junior Developer", level_of_interest: 40, city: "Denver",
        company_id: company.id)
      job_2 = Job.create(title: "Senior Developer", level_of_interest: 40, city: "Denver",
        company_id: company.id)
      tag = Tag.create(title: 'Cloud Storage')

      tag.jobs << job

      expect(tag.jobs.first).to eq(job)

      tag.jobs << job_2

      expect(tag.jobs.last).to eq(job_2)
      expect(tag.jobs.count).to eq(2)
    end
  end
end