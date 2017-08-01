RSpec.feature "a user visits job path" do
  scenario "and sees the jobs tags" do
    company = Company.create(name: "company")
    job = Job.create(title: "chief of awesome",
                     description: "awesomeness",
                     level_of_interest: 34,
                     company: company,
                     city: "Denver",
                     salary: 35000.00)
    job.tags.create(name: "engineering")
    job.tags.create(name: "sales")

    visit company_job_path(company, job)

    expect(page).to have_content(job.title)
    expect(page).to have_content("engineering")
    expect(page).to have_content("sales")
  end
end
