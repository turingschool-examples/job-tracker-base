RSpec.feature "user visits job path" do
  scenario "and sees average salary per job" do
    company = Company.create(name: "company")
    job_1 = Job.create(title: "chief of awesome",
                     description: "awesomeness",
                     level_of_interest: 34,
                     company: company,
                     city: "Denver",
                     salary: 10000.00)
   job_2 = Job.create(title: "chief of sad path",
                     description: "sadness",
                     level_of_interest: 24,
                     company: company,
                     city: "Boulder",
                     salary: 20000.00)
 job_3 = Job.create(title: "ninja master",
                   description: "sadness",
                   level_of_interest: 24,
                   company: company,
                   city: "Boulder",
                   salary: 30000.00)
   tag_1 = Tag.create(name: "engineering")
   tag_2 = Tag.create(name: "sales")
   tag_3 = Tag.create(name: "ninja")
    JobTag.create(job_id: job_1.id, tag_id: tag_1.id)
    JobTag.create(job_id: job_1.id, tag_id: tag_2.id)
    JobTag.create(job_id: job_2.id, tag_id: tag_2.id)
    JobTag.create(job_id: job_2.id, tag_id: tag_3.id)
    JobTag.create(job_id: job_3.id, tag_id: tag_3.id)


    visit company_job_path(company, job_1)

    expect(page).to have_content("15000")
    expect(page).to have_content("20000")
    expect(page).to have_content("25000")

  end
end
