require 'rails_helper'

describe Job do
  describe "validations" do
    it {is_expected.to validate_presence_of(:title)}
    it {is_expected.to validate_presence_of(:level_of_interest)}
    it {is_expected.to validate_presence_of(:city)}
    it {is_expected.to have_many(:job_tags)}
    it {is_expected.to have_many(:tags).through(:job_tags)}
  end
end
