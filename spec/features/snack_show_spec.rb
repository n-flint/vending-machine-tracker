require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'they see info for that snack' do
    snack_1 = Snack.create(name: "snack_1", price: 1.00)
    snack_2 = Snack.create(name: "snack_2", price: 2.00)
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks", snacks: [snack_1])
    turing  = owner.machines.create(location: "Turing", snacks: [snack_1])


    visit snack_path(snack_1)

    expect(page).to have_content(snack_1.name)
    expect(page).to have_content(snack_1.price)
    expect(page).to have_content(dons.location)
    expect(page).to have_content(turing.location)

  end
end
# As a visitor
# When I visit a snack show page
# I see the name of that snack
#   and I see the price for that snack
#   and I see a list of locations with vending machines that carry that snack
#   and I see the average price for snacks in those vending machines
#   and I see a count of the different kinds of items in that vending machine.
