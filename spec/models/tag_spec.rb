require 'rails_helper'

describe Tag do
  describe "validations" do
    it "is invalid without a title" do
      tag = Tag.new()
      expect(tag).to be_invalid
    end
    it "is valid with a title " do
      tag1 = Tag.new(title: "Unicorn catcher")
      expect(tag1).to be_valid
    end
  end
  describe "relationships" do
    it "has many job_tags" do
      tag = Tag.new(title: "Software")
      expect(tag).to respond_to(:job_tags)
    end
  end

  describe 'Instance Methods' do
    it '#count' do
      company = Company.create!(name: "ESPN")
      job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", salary: 70000)
      tag = Tag.create!(title: "Software")
      job_tag = JobTag.create!(job_id:job.id, tag_id:tag.id)

      expect(tag.count).to eq(1)
    end
    it '#average_salary' do
      company = Company.create!(name: "ESPN")
      job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", salary: 70000)
      tag = Tag.create!(title: "Software")
      job_tag = JobTag.create!(job_id:job.id, tag_id:tag.id)

      expect(tag.average_salary).to eq(70000)
    end
  end
end
