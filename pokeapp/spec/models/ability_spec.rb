require 'rails_helper'

RSpec.describe Ability, type: :model do
  let(:ability) { Ability.new(name: 'ability-t')}
  let(:ability_test) { Ability.new(name: 'ability-t')}

  before { ability.save }

  it 'name should be present' do
    expect(ability).to be_valid
  end

  it 'name should not be nil' do
    ability.name = nil
    expect(ability).to_not be_valid
  end

  it "validates uniqueness of name" do  
    expect(ability_test.save).to be(false)
    expect(ability_test.errors.full_messages).to include("Name has already been taken")
  end
end
