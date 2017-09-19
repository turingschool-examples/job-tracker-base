require 'rails_helper'

RSpec.feature "As a user" do
  context "When I visit a specific job page" do
    it "I see the name of each of the tags associated with that job" do
      one_job

      visit job_path(@job)
      save_and_open_page

      expect(page).to have_content("Tags:")
      expect(page).to have_content("Service")
    end
  end
end
