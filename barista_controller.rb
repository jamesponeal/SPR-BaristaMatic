class BaristaController

  attr_accessor :inventory, :costs, :recipes

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
    @costs = {
      "Coffee" => 0.75,
      "Decaf Coffee" => 0.75,
      "Sugar" => 0.25,
      "Cream" => 0.25,
      "Steamed Milk" => 0.35,
      "Foamed Milk" => 0.35,
      "Espresso" => 1.1,
      "Cocoa" => 0.9,
      "Whipped Cream" => 1
    }
    @recipes = {
      "Coffee" => [["Coffee", 3], ["Sugar", 1], ["Cream", 1]],
      "Decaf Coffee" => [["Decaf Coffee", 3], ["Sugar", 1], ["Cream", 1]],
      "Caffe Latte" => [["Espresso", 2], ["Steamed Milk", 1]],
      "Caffe Americano" => [["Espresso", 3]],
      "Caffe Mocha" => [["Espresso", 1], ["Cocoa", 1], ["Steamed Milk", 1], ["Whipped Cream", 1]],
      "Cappuccino" => [["Espresso", 2], ["Steamed Milk", 1], ["Foamed Milk", 1]]
    }
  end

  def reduce_inventory(item, qty)
    inventory[item] -= qty
  end

  def get_cost(item)
    total = 0
    recipes[item].each do |ingredient|
      total += (costs[ingredient[0]] * ingredient[1])
    end
    total.round(2)
  end

end

