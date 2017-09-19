require 'rails_helper'

RSpec.feature "As a user" do
  context "When I visit a specific job page" do
    it "I also see a count of how many jobs have each specific tag listed" do
      two_jobs

      visit job_path(@job_2)

      expect(page).to have_content("Tags:")
      expect(page).to have_content("Service - 2")
    end
  end
end
