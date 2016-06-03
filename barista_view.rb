class BaristaView

  def print_title
    wait_with_line(0.1)
    puts "~-"*15
    wait_with_line(0.1)
    puts "           Welcome to"
    wait_with_line(0.1)
    puts "          \e[32;1mBaristaMatic\e[0m"
    wait_with_line(0.1)
    puts "     by SPR Coffee Services"
    wait_with_line(0.1)
    puts "~-"*15
    wait_with_line(0.1)
  end

  def print_inventory(inventory)
    wait_with_line(0.1)
    puts "~-"*15
    sleep(0.1)
    puts "Inventory:"
    sleep(0.1)
    inventory.each do |item,qty|
      puts " #{item},#{qty}"
      sleep(0.1)
    end
    sleep(0.1)
    puts "~-"*15
    wait_with_line(0.1)
  end

  def print_menu(menu)

  end

  def wait_with_line(seconds)
    sleep(seconds)
    puts ""
  end

end