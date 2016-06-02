class BaristaController

  attr_accessor :inventory, :cost

  def initialize
    @inventory = {
      "Coffee" => 10,
      "Decaf Coffee" => 10,
      "Sugar" => 10,
      "Cream" => 10,
      "Steamed Milk" => 10,
      "Foamed Milk" => 10,
      "Espresso" => 10,
      "Cocoa" => 10,
      "Whipped Cream" => 10
    }

    @cost = {
      "Coffee" => 0.75,
      "Decaf Coffee" => 0.75,
      "Sugar" => 0.25,
      "Cream" => 0.25,
      "Steamed Milk" => 0.35,
      "Foamed Milk" => 0.35,
      "Espresso" => 1.10,
      "Cocoa" => 0.90,
      "Whipped Cream" => 1.00
    }
  end

  def reduce_inventory(item, qty)
    inventory[item] -= qty
  end

end

