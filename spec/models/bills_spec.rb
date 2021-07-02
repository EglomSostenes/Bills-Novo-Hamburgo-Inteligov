require 'rails_helper'

RSpec.describe Bill, type: :model do

    it "is valid factory_bot build" do
      bill = build(:bill)
      expect(bill).to be_valid
    end
  
    it "is invalid if name blank" do
        bill = build(:bill, name: "")
        expect(bill).to_not be_valid
    end
  
    it "is invalid if abstract blank" do
        bill = build(:bill, abstract: "")
        expect(bill).to_not be_valid
    end
  
    it "is invalid if link blank" do
        bill = build(:bill, link: "")
        expect(bill).to_not be_valid
    end
    
end