require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'validations' do
    it {is_expected.to validate_presence_of(:name)}
    it {is_expected.to validate_uniqueness_of(:name)}
    it {is_expected.to have_many(:job_tags)}
    it {is_expected.to have_many(:jobs).through(:job_tags)}
  end
end
