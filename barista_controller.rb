require_relative 'barista_view'

class BaristaController
  attr_reader :costs, :recipes, :view
  attr_accessor :inventory, :running

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
    @running = true
    @view = BaristaView.new
  end

  def reduce_inventory(item, qty)
    inventory[item] -= qty
  end

  def get_cost(item)
    total = 0
    recipes[item].each do |ingredient|
      total += (costs[ingredient[0]] * ingredient[1])
    end
    ("%.2f" % total)
  end

  def enough_inventory?(item)
    recipes[item].each do |ingredient|
      return false if inventory[ingredient[0]] < ingredient[1]
    end
    return true
  end

  def replenish_inventory
    inventory.each do |item,qty|
      if qty < 10
        inventory[item] = 10
      end
    end
  end

  def get_menu
    menu = []
    i = 0
    recipes.each do |item, ingredients|
      menu[i] = "#{i+1},#{item},$#{get_cost(item)},#{enough_inventory?(item)}"
      i += 1
    end
    menu
  end

  def evaluate_choice(choice)
    if choice == "Q" || choice == "q"
      # quit
    elsif choice == "R" || choice == "r"
      # restock
    elsif (1..6).include?(choice.to_i)
      # make drink
    else

    end
  end

  def valid_choice?(choice)
    ["1", "2", "3", "4", "5", "6", "Q", "q", "R", "r"].include?(choice)
  end

  def run_barista
    view.print_title
    view.print_inventory(inventory)
    view.print_menu(get_menu)
    while running
      input_valid = false
      until input_valid == true
        choice = view.ask_for_user_input
        input_valid = valid_choice?(choice)
        if input_valid == false
          view.display_invalid_input(choice)
        end
      end

      view.print_inventory(inventory)
      view.print_menu(get_menu)
    end
  end

end

