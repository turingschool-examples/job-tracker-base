describe "User sees a specific job" do
  scenario "and the job count for each of its tags" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    tag_1 = Tag.create!(name: "Sports")
    tag_2 = Tag.create!(name: "Denver")
    tag_3 = Tag.create!(name: "High Interest")
    job.tags << [tag_1, tag_2, tag_3]

    visit company_job_path(company, job)

    expect(page).to have_content("Sports - 1")
    expect(page).to have_content("Denver - 1")
    expect(page).to have_content("High Interest - 1")
  end
end
