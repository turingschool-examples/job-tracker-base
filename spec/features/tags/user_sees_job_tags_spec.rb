describe "User sees a specific job" do
  scenario "and its tags" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    tag_1 = Tag.create!(name: "Sports")
    tag_2 = Tag.create!(name: "Denver")
    tag_3 = Tag.create!(name: "High Interest")
    job.tags << [tag_1, tag_2, tag_3]
    # When I visit a specific job page,
    visit_company_job_path(job)
    # I see the name of each of the tags associated with that job.
    expect(page).to have_content tag_1.name
    expect(page).to have_content tag_2.name
    expect(page).to have_content tag_3.name
  end
end
