require 'rails_helper'

RSpec.describe Location do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a city" do
        location = Location.new()
        expect(location).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a city" do
        location = Location.new(city: "Denver")
        expect(location).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many companies" do
      location = Location.new(city: "Denver")
      expect(location).to respond_to(:companies)
    end
  end
end
