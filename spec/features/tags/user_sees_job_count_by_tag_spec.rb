RSpec.feature "user visits job path" do
  scenario "and sees job count by tag listed" do
    company = Company.create(name: "company")
    job_1 = Job.create(title: "chief of awesome",
                     description: "awesomeness",
                     level_of_interest: 34,
                     company: company,
                     city: "Denver",
                     salary: 35000.00)
    job_2 = Job.create(title: "chief of sad path",
                     description: "sadness",
                     level_of_interest: 24,
                     company: company,
                     city: "Boulder",
                     salary: 35000.00)
    job_1.tags.create(name: "engineering")
    job_1.tags.create(name: "sales")
    job_1.tags.create(name: "ninja")
    job_2.tags.create(name: "engineering")
    job_2.tags.create(name: "sales")

    visit company_job_path(company, job_1)

    expect(page).to have_content(job_1.title)
    expect(page).to have_content("engineering")
    expect(page).to have_content("sales")
    expect(page).to have_content("ninja")
    expect(page).to have_content("1")
    expect(page).to have_content("2")
  end
end
