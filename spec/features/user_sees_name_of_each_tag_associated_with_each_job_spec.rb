require 'rails_helper'

RSpec.feature "As a user" do
  context "When I visit a specific job page" do
    it "I see the name of each of the tags associated with that job" do
      one_job

      visit company_jobs_path(@company, @job)

      expect(page).to have_content("Tags:")
      expect(page).to have_content("Service - 5 (10000)")
    end
  end
end
