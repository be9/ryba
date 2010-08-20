require 'spec_helper'

describe "Ryba" do
  describe "Name" do
    before :all do
      @name = Ryba::Name
    end

    it "should work for male" do
      @name.first_name(true)
      @name.middle_name(true)
      @name.family_name(true)
      @name.full_name(true)
    end

    it "should work for female" do
      @name.first_name(false)
      @name.middle_name(false)
      @name.family_name(false)
      @name.full_name(false)
    end

    it "should work with random gender" do
      @name.gender do |gender|
        @name.first_name(gender)
        @name.middle_name(gender)
        @name.family_name(gender)
        @name.full_name(gender)
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

  describe "Address" do
    before :all do
      @adr = Ryba::Address
    end

    it "#index should be integer" do
      20.times do
        @adr.index.should be_kind_of(Integer)
      end
    end

    [:city, :full_city, :street, :address, :postal].each do |meth|
      it "##{meth} should return not empty string" do
        20.times do
          str = @adr.send(meth)
          str.should be_kind_of(String)
          str.should_not be_empty
        end
      end
    end
  end

  describe "Company" do
    it "#name should work" do
      20.times do
        n = Ryba::Company.name
        n.should_not be_empty
      end
    end

    it "#name with options should work" do
      20.times do
        n = Ryba::Company.name(:solidity => 3)
        n.should_not be_empty
      end
    end
  end
end
