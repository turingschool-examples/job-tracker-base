FactoryGirl.define do
  sequence :name do |n|
    "Tag #{n}"
  end

  factory :tag do
    name

    factory :tag_with_jobs do

      transient do
        job_count 2
      end

      after(:create) do |tag, evaluator|
        tag.jobs << create_list(:job, evaluator.job_count)
      end
    end
  end
end
