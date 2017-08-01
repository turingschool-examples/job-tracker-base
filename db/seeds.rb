Company.destroy_all
Job.destroy_all
Tag.destroy_all

COMPANIES = ["ESPN", "Aetna", "United Airlines", "Denver Public Schools", "Shopify", "Starbucks", "Pivotal Labs", "Captain U"]
JOBS = ["Engineering", "Development", "Dev Ops", "Quality Assurance", "Teacher", "Product Manager", "Consultant", "Community Manager"]
CITIES = ["Seattle", "Denver", "Portland", "Indianapolis", "Madison", "Orlando", "San Diego", "Austin", "Las Vegas", "Little Rock", "Boise", "Eugene", "Oakland"]
TAGS = ["Software", "Leadership", "Teammate", "Quality Assurance"]

COMPANIES.each do |name|
  company = Company.create!(name: name)
  puts "Created #{company.name}"
  10.times do |num|
    job = company.jobs.create!(title: JOBS.sample, description: "What a great position!", level_of_interest: num + rand(100), city: CITIES.sample, salary: rand(50000..125000))
    puts "  Created #{company.jobs[num].title}"
  end

end

@job = Job.all
TAGS.each do |var|
  tag = @job.sample.tags.create(name: var)
  t = @job.sample.tags.create(name: var)
end

@tags = Tag.all

Job.all.each do |job|
  job.tags << @tags.sample
  job.tags << @tags.sample
  job.tags << @tags.sample
end
