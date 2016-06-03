class BaristaView

  def print_title
    sleep(0.2)
    puts "~-"*15
    wait_with_line(0.2)
    puts "           Welcome to"
    wait_with_line(0.2)
    puts "          \e[32;1mBaristaMatic\e[0m"
    wait_with_line(0.2)
    puts "     by SPR Coffee Services"
    wait_with_line(0.2)
    puts "~-"*15
    sleep(0.2)
  end

  def print_inventory(inventory)
    sleep(0.1)
    puts "Inventory:"
    sleep(0.1)
    inventory.each do |item,qty|
      puts " #{item},#{qty}"
      sleep(0.1)
    end
    sleep(0.1)
  end

  def print_menu(menu)
    sleep(0.1)
    puts "Menu:"
    sleep(0.1)
    menu.each do |line|
      puts " #{line}"
      sleep(0.1)
    end
    sleep(0.1)
  end

  def ask_for_user_input
    wait_with_line(0.1)
    puts "What would you like?"
    puts "Please enter a drink number, 'q' to quit, or 'r' to restock"
    gets.chomp
  end

  def display_invalid_input(choice)
    wait_with_line(0.1)
    puts "Invalid selection: #{choice}"
    wait_with_line(0.1)
  end

  def display_drink_selection(drink_name)
    wait_with_line(0.1)
    puts "Dispensing: #{drink_name}"
    wait_with_line(0.1)
  end

  def display_out_of_stock(drink_name)
    wait_with_line(0.1)
    puts "Out of stock: #{drink_name}"
    wait_with_line(0.1)
  end

  def display_inventory_replenish
    wait_with_line(0.1)
    puts "You have replenished the inventory."
    wait_with_line(0.1)
  end

  def goodbye_message
    wait_with_line(0.1)
    puts "~-"*15
    wait_with_line(0.1)
    puts "     Thank you for choosing"
    wait_with_line(0.1)
    puts "          \e[32;1mBaristaMatic\e[0m"
    wait_with_line(0.1)
    puts "     by SPR Coffee Services"
    wait_with_line(0.1)
    puts "~-"*15
    wait_with_line(0.1)
  end

  def wait_with_line(seconds)
    sleep(seconds)
    puts ""
  end

end