require File.dirname(__FILE__) + '/spec_helper'

describe "Ryba" do
  describe "Name" do
    before :all do
      @name = Ryba::Name
    end

    it "should work for male" do
      @name.first_name(true)
      @name.middle_name(true)
      @name.family_name(true)
    end
    
    it "should work for female" do
      @name.first_name(false)
      @name.middle_name(false)
      @name.family_name(false)
    end

    it "should work with random gender" do
      @name.gender do |gender|
        @name.first_name(gender)
        @name.middle_name(gender)
        @name.family_name(gender)
      end
    end
  end

  describe "PhoneNumber" do
    before :all do
      @pn = Ryba::PhoneNumber
    end

    it "should work" do
      20.times do
        @pn.phone_number.should match(/\d/)
      end
    end
  end
end
