require 'rails_helper'

feature "User" do
  context "visits specific job page" do
    scenario "see associated tags for job" do
      company = Company.create(id: 1, name: 'ESPN')
      job = Job.create(title: 'Thing', description: 'Does the thing', level_of_interest: 100, company_id: 1,
                      city: 'Denver', salary: 20000)
      job.tags << Tag.create(name: 'DWS')
      visit company_job_path(company, job)
      
      expect(page).to have_content(job.tags.first.name)     
    end
    
    scenario "see number of jobs with that tag" do
      company = Company.create(id: 1, name: 'ESPN')
      company = Company.create(id: 2, name: 'Turing')
      job = Job.create(title: 'Thing', description: 'Does the thing', level_of_interest: 100, company_id: 1,
                      city: 'Denver', salary: 20000)
      job_2 = Job.create(title: 'Thing', description: 'Does the thing', level_of_interest: 100, company_id: 2,
                        city: 'Denver', salary: 15000)
      job_2.tags << Tag.create(name: 'DWS')
      job.tags << Tag.create(name: 'DWS')
      visit company_job_path(company, job)
      
      expect(page).to have_content(job.tags.first.name)     
      expect(page).to have_content(job.tags.first.jobs.count)     
    end
    
    scenario "see average salary jobs with that tag." do
      company = Company.create(id: 1, name: 'ESPN')
      company = Company.create(id: 2, name: 'Turing')
      job = Job.create(title: 'Thing', description: 'Does the thing', level_of_interest: 100, company_id: 1,
                      city: 'Denver', salary: 20000)
      job_2 = Job.create(title: 'Thing', description: 'Does the thing', level_of_interest: 100, company_id: 2,
                        city: 'Denver', salary: 15000)
      tag = Tag.create(name: 'DWS')
      tag_2 = Tag.create(name: 'Dev')
      job_2.tags << tag
      job.tags << tag
      visit company_job_path(company, job)

      expect(page).to have_content(job.tags.first.salary_average) 
      expect(page).to have_content(17500)    
    end
  end
end