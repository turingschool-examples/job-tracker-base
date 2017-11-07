require 'rails_helper'

describe Tag do
  describe "instance methods" do
    before :each do
      @company = Company.create!(name: "ESPN")
      @tag = Tag.create(name: "Colorado")
      @tag.jobs.create(title: "Developer", description: "sports", salary: 60000, level_of_interest: 70, city: "Denver", company: @company)
      @tag.jobs.create(title: "Developer", description: "education", salary: 70000, level_of_interest: 80, city: "Denver", company: @company)
    end

    it "#job_count" do
      expect(@tag.job_count).to eq(2)
    end
  end
end
