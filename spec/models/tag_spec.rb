require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'validations' do
    it {is_expected.to validate_presence_of(:name)}
    it {is_expected.to validate_uniqueness_of(:name)}
    it {is_expected.to have_many(:job_tags)}
    it {is_expected.to have_many(:jobs).through(:job_tags)}
  end

  describe 'instance methods' do
    let(:company) { Company.create!(name: 'Cherry Creek Mall') }
    let(:job_attributes) { {title: 'Janitor', description: 'Cleans stuff',
                             level_of_interest: 4, city: 'Denver', salary: 24000,
                             company_id: company.id} }
    let(:job2_attributes) { {title: 'Security Guard', description: 'Guards stuff',
                             level_of_interest: 3, city: 'Denver', salary: 25000,
                             company_id: company.id} }
    let(:job3_attributes) { {title: 'Parking Ambassador', description: 'Helps people park',
                             level_of_interest: 1, city: 'Denver', salary: 22000,
                             company_id: company.id} }
    let(:job) { Job.create!(job_attributes) }
    let(:job2) { Job.create!(job2_attributes) }
    let(:job3) { Job.create!(job3_attributes) }
    let(:tag1) { Tag.create!(name: 'Last Resort') }
    let(:tag2) { Tag.create!(name: 'I hope not') }
    let(:tag3) { Tag.create!(name: 'Only if I have to') }
    let(:tag4) { Tag.create!(name: 'Dream Job') }

    describe '#total_jobs' do
      it "should return the number of jobs associated with a tag" do
        job.tags << [tag1, tag2, tag3]
        tag1.jobs << job2

        expect(tag1.total_jobs).to eq(2)
      end
    end

    describe '#average_job_salary' do
      it "should return the average salary for all jobs associated with tag" do
        tag2.jobs << [job, job2, job3]

        expect(tag2.average_job_salary).to eq 23666.67
      end
    end
  end
end
