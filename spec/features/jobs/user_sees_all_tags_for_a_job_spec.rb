require 'rails_helper'

describe "When a visit a specific job page" do
  describe "as a user" do
    before :each do
      @company = Company.create!(name: "ESPN")
      @job = @company.jobs.create!(title: "Developer", description: "sports", salary: 60000, level_of_interest: 70, city: "Denver")

      @tag1 = @job.tags.create(name: "Great-company")
      @tag2 = @job.tags.create(name: "Software")

    end
    scenario "I see all tags associated with a job" do
      visit company_job_path(@company, @job)

      expect(page).to have_content("ESPN")
      expect(page).to have_content("Developer")
      expect(page).to have_content("70")

      within ".job-tags" do
        expect(page).to have_content("Great-company - 1")
        expect(page).to have_content("Software - 1")
      end
    end

    scenario "I see tags that have more than just one job" do
      company2 = Company.create!(name: "Guild Education")
      job2 = company2.jobs.create!(title: "Developer", description: "education", salary: 70000, level_of_interest: 90, city: "Denver")

      job2.tags << @tag1
      job2.tags << @tag2
      job2.tags.create(name: "Education")

      visit company_job_path(company2, job2)

      within ".job-tags" do
        expect(page).to have_content("Great-company - 2 (65000)")
        expect(page).to have_content("Software - 2 (65000)")
        expect(page).to have_content("Education - 1 (70000)")
      end
    end
  end
end
