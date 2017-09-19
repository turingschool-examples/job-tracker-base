require 'rails_helper'

feature "User" do
  context "visits specific job page" do
    scenario "see associated tags for job" do
      company = Company.create!(id: 1, name: 'ESPN')
      job = Job.create!(title: 'Thing', description: 'Does the thing', level_of_interest: 100, company_id: 1,
                      city: 'Denver', salary: 20000)
      job.tags << Tag.create!(name: 'DWS')
      visit company_job_path(company, job)
      
      expect(page).to have_content(job.tags.first.name)     
                      
    end
  end
end