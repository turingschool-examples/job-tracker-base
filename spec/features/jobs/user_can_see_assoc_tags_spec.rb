require 'rails_helper'

feature "User" do
  context "visits specific job page" do
    scenario "see associated tags for job" do
      job = Job.create(title: 'Thing', description: 'Does the thing', level_of_interest: 100, company_id: 1,
                      city: 'Denver', salary: 20000)
      job.tags << Tag.create(id: 1, name: 'DWS')
      
      visit job_path(job)
      
      expect(page).to have_content(tag.name)     
                      
    end
  end
end