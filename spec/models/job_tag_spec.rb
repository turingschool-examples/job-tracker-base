require 'rails_helper'

RSpec.describe JobTag, type: :model do
  context "Relationships" do
    it { should belong_to(:job) }
    it { should belong_to(:tag) }
  end
end
