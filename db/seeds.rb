Company.destroy_all
Job.destroy_all

COMPANIES = ["ESPN", "Aetna", "United Airlines", "Denver Public Schools", "Shopify", "Starbucks", "Pivotal Labs", "Captain U"]
JOBS = ["Engineering", "Development", "Dev Ops", "Quality Assurance", "Teacher", "Product Manager", "Consultant", "Community Manager"]
CITIES = ["Seattle", "Denver", "Portland", "Indianapolis", "Madison", "Orlando", "San Diego", "Austin", "Las Vegas", "Little Rock", "Boise", "Eugene", "Oakland"]
TAGS = ["Good Location", "Software", "Hardware", "Good Pizza", "Good Merntains"]

COMPANIES.each do |name|
  company = Company.create!(name: name)
  puts "Created #{company.name}"
  10.times do |num|
    company.jobs.create!(title: JOBS.sample, description: "What a great position!", level_of_interest: num + rand(100), city: CITIES.sample, salary: rand(50000..125000))
    puts "  Created #{company.jobs[num].title}"
  end
end

Job.all.each do |job|
  job.tags.create!(name: TAGS.sample)
  job.tags.create!(name: TAGS.sample)
  puts "  Created #{job.title} with tag #{job.tags}"
end
