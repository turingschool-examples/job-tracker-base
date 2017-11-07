require 'rails_helper'

describe "When a visit a specific job page" do
  describe "as a user" do
    before :each do
      @company = Company.create!(name: "ESPN")
      @job = @company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")

      @job.tags.create(name: "Great-company")
      @job.tags.create(name: "Software")

      visit company_job_path(@company, @job)
    end
    scenario "I see all tags associated with a job" do
      expect(page).to have_content("ESPN")
      expect(page).to have_content("Developer")
      expect(page).to have_content("70")

      within ".job-tags" do
        expect(page).to have_content("Great-company - 1")
        expect(page).to have_content("Software - 1")
      end
    end

    xscenario "I see tags that have more than just one job" do

    end
  end
end
