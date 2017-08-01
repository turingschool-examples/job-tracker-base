FactoryGirl.define do
  sequence :title do |n|
    "Title #{n}"
  end

  sequence :level_of_interest do |n|
    "Title #{n}"
  end

  sequence :city do |n|
    "city #{n}"
  end

  factory :job do
    title
    level_of_interest
    city
    company

    factory :job_with_tags do

      transient do
        tag_count 2
      end

      after(:create) do |job, evaluator|
        job.tags << create_list(:tag, evaluator.tag_count)
      end
    end
  end
end
