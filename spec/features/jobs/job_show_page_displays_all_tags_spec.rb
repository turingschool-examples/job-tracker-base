require "rails_helper"

describe "When a user looks at a job page" do
  it " they see all the tags associated with that job" do
    company = Company.create(name: "Papa John's Pizza")
    free_food = Tag.create(title: "Free Food")
    flexible = Tag.create(title: "Flexible Hours")

    job1 = company.jobs.create(title: "Software Developer", description: "develop software",
                    level_of_interest: 5, city: "Denver", salary: 75000, tag_id: flexible.id)
    job2 = company.jobs.create(title: "Software Developer", description: "develop software",
                    level_of_interest: 5, city: "Denver", salary: 100000, tag_id: flexible.id)
    job3 = company.jobs.create(title: "Software Developer", description: "develop software",
                    level_of_interest: 5, city: "Denver", salary: 50000, tag_id: flexible.id)
    
    Jobtag.create(job_id: job1.id, tag_id: free_food.id)
    Jobtag.create(job_id: job1.id, tag_id: flexible.id)
    Jobtag.create(job_id: job2.id, tag_id: free_food.id)
    Jobtag.create(job_id: job2.id, tag_id: flexible.id)
    Jobtag.create(job_id: job3.id, tag_id: free_food.id)

    visit company_job_path(company, job1)

    expect(page).to have_content("Software Developer")
    expect(page).to have_content("Free Food")
    expect(page).to have_content("Flexible Hours")
    #the quantities by tag
    expect(page).to have_content(2)
    expect(page).to have_content(3)
    #the average salary by tag
    save_and_open_page
    expect(page). to have_content(75000)
    expect(page). to have_content(87500)

    
  end

 end
