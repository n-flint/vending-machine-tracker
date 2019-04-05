require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end

  describe '#instance_methods' do
    it '#avg_price' do
      snack_1 = Snack.create(name: "snack_1", price: 1.00)
      snack_2 = Snack.create(name: "snack_2", price: 2.00)
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks", snacks: [snack_1, snack_2])

      expect(dons.avg_price).to eq(1.50)
    end
  end
end
