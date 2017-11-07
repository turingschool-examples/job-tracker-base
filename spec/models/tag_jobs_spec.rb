require 'rails_helper'

RSpec.describe TagJob do
  describe "relationships" do
    it { should belong_to(:job) }
    it { should belong_to(:tag) }
  end
end