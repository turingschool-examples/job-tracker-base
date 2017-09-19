require 'rails_helper'

describe Tag do
  describe 'validations' do
    context 'invalid attributes' do
      it 'is invalid without a name' do
      company = Company.new(name: "ESPN")
      job = company.jobs.new(title: "Developer", level_of_interest: 70, city: "Denver", salary: 22000)
      tag = Tag.new(name: )

      expect(tag).to be_invalid
      end
    end
  end

  describe "relationships" do
    it 'belongs to a job' do
      tag = Tag.create(name: "Software")

      expect(tag).to respond_to(:job_tag)
    end
  end
end
