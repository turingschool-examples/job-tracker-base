require 'rails_helper'

RSpec.describe Tagging, type: :model do
  it "belongs to tag" do
    tagging = Tagging.new(tag_id: 1, job_id: 1)
    expect(tagging).to respond_to(:tag)
  end
  it "belongs to job" do
    tagging = Tagging.new(tag_id: 1, job_id: 1)
    expect(tagging).to respond_to(:job)
  end
end
