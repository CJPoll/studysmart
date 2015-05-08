require 'rails_helper'

RSpec.describe University, type: :model do
  before :each do
    @university = FactoryGirl.build(:university)
  end

  it 'has a valid factory' do
    expect(@university).to be_valid
  end

  it 'requires a name' do
    @university.name = nil
    expect(@university).to_not be_valid
  end
end
