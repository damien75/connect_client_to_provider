require 'rails_helper'

describe Specialty, type: :model do
  it "does not allow duplicate Specialty per provider" do
    provider = Provider.create(:name => "Test name" , :status => "Test Status")
    provider.specialties.create(:title => "specialty test" , :description => "random description")
    specialty = provider.specialties.build(:title => "specialty test" , :description => "other random description")
    expect(specialty).to_not be_valid
    expect(specialty.errors[:title]).to include('has already been taken')
  end
end
