require_relative 'barista_view'
require_relative 'barista_controller'

barista = BaristaController.new
view = BaristaView.new
view.print_title
view.print_inventory(barista.inventory)

