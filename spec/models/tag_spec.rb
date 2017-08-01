require 'rails_helper'

RSpec.describe Tag,"associations", type: :model do
  it { should have_many(:job_tags) }
  it { should have_many(:jobs).through(:job_tags) }
end
