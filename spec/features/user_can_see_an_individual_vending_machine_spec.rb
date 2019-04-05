require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end
  scenario 'they see all snacks for that machine' do
    snack_1 = Snack.create(name: "snack_1", price: 1.00)
    snack_2 = Snack.create(name: "snack_2", price: 2.00)
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks", snacks: [snack_1, snack_2])

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
    expect(page).to have_content(snack_1.name)
    expect(page).to have_content(snack_1.price)
    expect(page).to have_content(snack_2.name)
    expect(page).to have_content(snack_2.price)
  end
  scenario 'they see average price for all snacks in that machine' do
    snack_1 = Snack.create(name: "snack_1", price: 1.00)
    snack_2 = Snack.create(name: "snack_2", price: 2.00)
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks", snacks: [snack_1, snack_2])

    visit machine_path(dons)
    avg_price = dons.avg_price

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
    expect(page).to have_content("Average Price: #{avg_price}")
  end
end

# User Story 1 of 3
#
# As a user
# When I visit a vending machine show page
# I see the name of all of the snacks associated with that vending machine along with their price
