class BaristaController

  attr_accessor :inventory, :cost

  def initialize
    @inventory = {
      "coffee" => 10,
      "decaf coffee" => 10,
      "sugar" => 10,
      "cream" => 10,
      "steamed milk" => 10,
      "foamed milk" => 10,
      "espresso" => 10,
      "cocoa" => 10,
      "whipped cream" => 10
    }

    @cost = {
      "coffee" => 0.75,
      "decaf coffee" => 0.75,
      "sugar" => 0.25,
      "cream" => 0.25,
      "steamed milk" => 0.35,
      "foamed milk" => 0.35,
      "espresso" => 1.10,
      "cocoa" => 0.90,
      "whipped cream" => 1.00
    }
  end

  def start
    puts "Hello!"
    puts "coffee costs #{@cost["coffee"]}"
  end

end

