require 'rails_helper'

describe Provider, type: :model do
  describe "DB with providers" do
    before :each do
      @provider1 = Provider.create!(:company => "Company 1" , :status => "public" , :specialty => "specialty 1")
      @provider2 = Provider.create!(:company => "Company 2" , :status => "private" , :specialty => "specialty 2")
      @provider3 = Provider.create!(:company => "Company 3" , :status => "private" , :specialty => "specialty 1")
      @provider4 = Provider.create!(:company => "Company 4" , :status => "public" , :specialty => "specialty 2")
    end

    it "should contain all the providers" do
      expect(Provider.all).to include @provider1
      expect(Provider.all).to include @provider2
      expect(Provider.all).to include @provider3
      expect(Provider.all).to include @provider4
    end

    describe "Adding a new provider" do
      it "sould increase the number of providers by 1" do
        @newProvider = Provider.create!(:company => "Company 5" , :status => "public" , :specialty => "specialty 1")
        expect(Provider.count).to eq(5)
      end

      describe "Adding a new provider should fail with missing information" do
        it "passes validation with a all information" do
          testProvider = Provider.new(:company => "test company" , :status => "test status" , :specialty => "test specialty")
          expect(testProvider).to be_valid
        end

        it "fails validation with no company" do
          testProvider = Provider.new(:company => nil)
          expect(testProvider).to_not be_valid
          expect(testProvider.errors[:company]).to include "can't be blank"
        end

        it "is invalid if duplicate company" do
          Provider.create!(:company => "test company" , :status => "test status" , :specialty => "test specialty")
          testProvider = Provider.new(:company => "test company" , :status => "test status" , :specialty => "test specialty")
          expect(testProvider).to_not be_valid
          expect(testProvider.errors[:company]).to include "has already been taken"
        end

        it "fails validation with no status" do
          testProvider = Provider.new(:company => "test company" , :specialty => "test specialty")
          expect(testProvider).to_not be_valid
          expect(testProvider.errors[:status]).to include "can't be blank"
        end

        it "fails validation with no specialty" do
          testProvider = Provider.new(:company => "test company" , :status => "test status")
          expect(testProvider).to_not be_valid
          expect(testProvider.errors[:specialty]).to include "can't be blank"
        end
      end
    end
  end
end
