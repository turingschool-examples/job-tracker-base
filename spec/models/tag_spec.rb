require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'validations' do
    describe 'invalid' do
      it 'is invalid without a title' do
        tag = Tag.create
        expect(tag).to be_invalid
      end
      it 'is invalid without a unique title' do
        Tag.create(title: "Yeah")
        tag = Tag.create(title: "Yeah")
        expect(tag).to be_invalid
      end
    end
    describe 'valid' do
      it 'is valid with a unique title' do
        Tag.create(title: "Yeah")
        tag = Tag.create(title: "Yeah buddy")
        expect(tag).to be_valid
      end
    end
  end
  describe 'relationships' do
    it 'has jobs' do
      tag = Tag.create(title: "Yeah")
      expect(tag).to respond_to(:jobs)
    end
  end
  describe 'relationships' do
    it 'has job_tags' do
      tag = Tag.create(title: "Yeah")
      expect(tag).to respond_to(:job_tags)
    end
  end
end
