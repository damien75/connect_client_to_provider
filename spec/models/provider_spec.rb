require 'rails_helper'

describe Provider, type: :model do
  before :each do
    @status1 = double('Status')
    allow(@status1).to receive(:id).and_return(1)
    allow(@status1).to receive(:title).and_return('public')
    @status2 = double('Status')
    allow(@status2).to receive(:id).and_return(2)
    allow(@status2).to receive(:title).and_return('private')
    @specialty1 = double('Specialty')
    allow(@specialty1).to receive(:id).and_return(1)
    allow(@specialty1).to receive(:title).and_return('Specialty 1')
    @specialty2 = double('Specialty')
    allow(@specialty2).to receive(:id).and_return(2)
    allow(@specialty2).to receive(:title).and_return('Specialty 2')
  end

  describe "Adding a new provider" do

    it "passes validation with a all information" do
      testProvider = Provider.new(:name => "test name" , :status_id => @status1.id , :specialty_id => @specialty1.id)
      expect(testProvider).to be_valid
    end

    it "fails validation with name too short" do
      testProvider = Provider.new(:name => "yo")
      expect(testProvider).to_not be_valid
      expect(testProvider.errors[:name]).to include "is too short (minimum is 5 characters)"
    end

    it "fails validation with no name" do
      testProvider = Provider.new(:name => nil)
      expect(testProvider).to_not be_valid
      expect(testProvider.errors[:name]).to include "can't be blank"
    end

    it "is invalid if duplicate name" do
      Provider.create!(:name => "test name" , :status_id => @status1.id , :specialty_id => @specialty1.id)
      testProvider = Provider.new(:name => "test name" , :status_id => @status2.id , :specialty_id => @specialty2.id)
      expect(testProvider).to_not be_valid
      expect(testProvider.errors[:name]).to include "has already been taken"
    end

    it "fails validation with no status" do
      testProvider = Provider.new(:name => "test name" , :specialty_id => @specialty1.id)
      expect(testProvider).to_not be_valid
      expect(testProvider.errors[:status_id]).to include "can't be blank"
    end

    it "fails validation with no specialty" do
      testProvider = Provider.new(:name => "test name" , :status_id => @status1.id)
      expect(testProvider).to_not be_valid
      expect(testProvider.errors[:specialty_id]).to include "can't be blank"
    end

    it "sould increase the number of providers by 1" do
      expect {Provider.create!(:name => 'name 5' , :status_id => @status1.id , :specialty_id => @specialty1.id)}.to change {Provider.count}.by(1)
    end

  end

  describe "DB with providers" do
    before :each do
      @provider1 = Provider.create!(:name => 'name 1' , :status_id => @status1.id , :specialty_id => @specialty1.id)
      @provider2 = Provider.create!(:name => 'name 2' , :status_id => @status1.id , :specialty_id => @specialty2.id)
      @provider3 = Provider.create!(:name => 'name 3' , :status_id => @status2.id , :specialty_id => @specialty1.id)
      @provider4 = Provider.create!(:name => 'name 4' , :status_id => @status2.id , :specialty_id => @specialty2.id)
    end

    it "should contain all the providers" do
      expect(Provider.all).to include @provider1
      expect(Provider.all).to include @provider2
      expect(Provider.all).to include @provider3
      expect(Provider.all).to include @provider4
    end

  end
end
