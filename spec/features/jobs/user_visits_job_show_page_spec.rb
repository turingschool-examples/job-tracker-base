require 'rails_helper'

describe "user visits job show page" do
  it "they see all associated tags" do
    tag = Tag.create(name: "Good Location")
    company = Company.create(name: "Apple")
    job = company.jobs.create(title: "Software Engineer",
                              description: "All the thinky thinky typey typey things",
                              level_of_interest: 10,
                              city: "Sacramento",
                              salary: 100000)
    tagjob = TagJob.create(tag: tag, job: job)

    visit company_job_path(company, job)

    expect(page).to have_content(job.title)
    expect(page).to have_content("Tags:")
    expect(page).to have_content(tag.name)
  end

  it "they see a count of jobs associated with that tag" do
    tag = Tag.create(name: "Good Location")
    company = Company.create(name: "Apple")
    job1 = company.jobs.create(title: "Software Engineer",
                              description: "All the thinky thinky typey typey things",
                              level_of_interest: 10,
                              city: "Sacramento",
                              salary: 100000)
    job2 = company.jobs.create(title: "HR",
                               description: "The hirey hirey things",
                               level_of_interest: 2,
                               city: "Detroit",
                               salary: 50000)
    tagjob = TagJob.create(tag: tag, job: job1)
    tagjob = TagJob.create(tag: tag, job: job2)

    visit company_job_path(company, job1)

    expect(page).to have_content(job1.title)
    expect(page).to have_content("#{tag.name} - #{tag.count_of_jobs}")
  end
end