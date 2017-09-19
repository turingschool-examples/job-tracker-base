module Helpers
  def one_job
    @tag = Tag.create(name: "Service")
    description = "Promotes coffee consumption by educating customers; selling coffee and coffee grinding and brewing equipment, accessories, and supplies; preparing and serving a variety of coffee drinks, along with pastries and cookies."
    @company = Company.create(name: "Starbucks")
    @job = @company.jobs.create(title: "Barista", description: description, level_of_interest: 70, city: "Denver", salary: 12000)
    @job.tags << @tag
  end

  def two_jobs
    description = "Responsible for taking money in the form of cash, check, or credit card from patrons in exchange for food or services. Scans items, provides change, balances drawer, and processes card transactions."
    one_job
    @company_2 = Company.create(name: "REI")
    @job_2 = @company_2.jobs.create(title: "Cashier", description: description, level_of_interest: 100, city: "Denver", salary: 15000)
    @job_2.tags << @tag
  end
end
