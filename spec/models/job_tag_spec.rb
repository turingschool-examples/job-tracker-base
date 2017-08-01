require 'rails_helper'

RSpec.describe JobTag, type: :model do
  describe 'validations' do
    it {is_expected.to belong_to(:job)}
    it {is_expected.to belong_to(:tag)}
  end
end
