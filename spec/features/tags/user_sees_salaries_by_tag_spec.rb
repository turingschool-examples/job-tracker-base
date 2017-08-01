describe "User sees a specific job" do
  scenario "and the average salary for each of its tags" do
    # As a user,
    company = Company.create!(name: "ESPN")
    company_2 = Company.create!(name: "Sports Authority")
    company_3 = Company.create!(name: "FedEx")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", salary: 70000)
    job_2 = company_2.jobs.create!(title: "Engineer", level_of_interest: 40, city: "Longmont", salary: 75000)
    job_3 = company_3.jobs.create!(title: "QA", level_of_interest: 75, city: "Loveland", salary: 80000)
    tag_1 = Tag.create!(name: "Sports")
    tag_2 = Tag.create!(name: "Denver")
    tag_3 = Tag.create!(name: "High Interest")
    tag_4 = Tag.create!(name: "Not Denver")
    tag_5 = Tag.create!(name: "Probably Easy")
    job.tags << [tag_1, tag_2, tag_3]
    job_2.tags << [tag_1, tag_2, tag_4]
    job_3.tags << [tag_3, tag_4, tag_5]
    # When I visit a specific job page,
    visit company_job_path(company, job)
    # I also see an average salary for all jobs within each specific tag listed.
    expect(page).to have_content("Sports - 2 (72500)")
    expect(page).to have_content("Denver - 2 (72500)")
    expect(page).to have_content("High Interest - 2 (75000)")
  end
end
