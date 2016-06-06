require_relative 'barista_view'

class BaristaMatic
  attr_reader :costs, :recipes, :view
  attr_accessor :inventory

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
    @view = BaristaView.new
  end

  def reduce_inventory(item, qty)
    inventory[item] -= qty
  end

  def get_cost(drink_name)
    total = 0
    recipes[drink_name].each do |ingredient|
      total += (costs[ingredient[0]] * ingredient[1])
    end
    ("%.2f" % total)
  end

  def enough_inventory?(drink_name)
    recipes[drink_name].each do |ingredient|
      return false if inventory[ingredient[0]] < ingredient[1]
    end
    return true
  end

  def replenish_inventory
    inventory.each do |item,qty|
      inventory[item] = 10
    end
  end

  def get_menu
    menu = []
    drink_names = recipes.keys
    for i in 0..(drink_names.length-1)
      menu[i] = "#{i+1},#{drink_names[i]},$#{get_cost(drink_names[i])},#{enough_inventory?(drink_names[i])}"
    end
    menu
  end

  def get_drink_name(number)
    drink_names = recipes.keys
    drink_names[number.to_i-1]
  end

  def make_drink(drink_name)
    recipes[drink_name].each do |ingredient|
      reduce_inventory(ingredient[0], ingredient[1])
    end
  end

  def evaluate_choice(choice)
    if choice == "Q" || choice == "q"
      view.goodbye_message
      exit
    elsif choice == "R" || choice == "r"
      view.display_inventory_replenish
      replenish_inventory
    elsif ["1", "2", "3", "4", "5", "6"].include?(choice)
      drink_name = get_drink_name(choice)
      if enough_inventory?(drink_name)
        view.display_drink_selection(drink_name)
        make_drink(drink_name)
      else
        view.display_out_of_stock(get_drink_name(choice))
      end
    end
  end

  def valid_choice?(choice)
    ["1", "2", "3", "4", "5", "6", "Q", "q", "R", "r"].include?(choice)
  end

  def get_user_choice
    input_validity = false
    until input_validity
      choice = view.ask_for_user_input
      input_validity = valid_choice?(choice)
      view.display_invalid_input(choice) if input_validity == false
    end
    choice
  end

  def run_barista
    view.print_title
    view.print_inventory(inventory)
    view.print_menu(get_menu)
    while true
      choice = get_user_choice
      evaluate_choice(choice)
      view.print_inventory(inventory)
      view.print_menu(get_menu)
    end
  end

end

