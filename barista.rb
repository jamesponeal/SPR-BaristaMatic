require_relative 'barista_view'
require_relative 'barista_controller'

barista = BaristaController.new
view = BaristaView.new
view.print_title
barista.start
