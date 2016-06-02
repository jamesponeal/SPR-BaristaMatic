class BaristaView

  def print_title
    puts ""
    wait_with_line(1,0.1)
    puts "~-"*15
    wait_with_line(1,0.1)
    puts "           Welcome to"
    wait_with_line(1,0.1)
    puts "          \e[32;1mBaristaMatic\e[0m"
    wait_with_line(1,0.1)
    puts "     by SPR Coffee Services"
    wait_with_line(1,0.1)
    puts "~-"*15
    wait_with_line(1,0.1)
  end

  def wait_with_line(number, seconds)
    number.times do
      sleep(seconds)
      puts ""
    end
  end

end