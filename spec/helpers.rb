module Helpers
  def one_job
    description = "Promotes coffee consumption by educating customers; selling coffee and coffee grinding and brewing equipment, accessories, and supplies; preparing and serving a variety of coffee drinks, along with pastries and cookies."
    @company = Company.create(name: "Starbucks")
    @job = company.jobs.create(title: "Barista", description: description, level_of_interest: 70, city: "Denver", salary: 12000)
  end
end
