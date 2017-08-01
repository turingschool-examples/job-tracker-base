require 'rails_helper'

describe "As a user" do
  context "on a job page" do
    before(:each) do
      @job = create(:job_and_tags, tag_count: 2)
      @company = @job.company
      @tag1 = @job.tags.first
      @tag2 = @job.tags.last
    end

    it "can see tags associated with job" do
      visit company_job_path(@company, @job)

      expect(page).to have_content(@tag1.name)
      expect(page).to have_content(@tag2.name)
    end

    it "can see count of jobs per tags for each associated with job" do
      job2 = create(:job)
      @tag1.jobs << job2

      visit company_job_path(@company, @job)
      expect(page).to have_content("#{@tag1.name}: 2")
      expect(page).to have_content("#{@tag2.name}: 1")

      visit company_job_path(@company, job2)
      expect(page).to have_content("#{@tag1.name}: 2")
      expect(page).to_not have_content("#{@tag2.name}: 1")
    end
  end
end
