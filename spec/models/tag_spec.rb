require 'rails_helper'

RSpec.describe Tag do
  describe "validations" do
    it { should validate_presence_of(:title) }
  end

  describe 'relationships' do
    it { should have_many(:jobs) }
    it { should respond_to(:jobs) }
  end
end