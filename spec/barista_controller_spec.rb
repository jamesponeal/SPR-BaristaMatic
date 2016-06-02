require_relative '../barista_controller'

describe "BaristaController" do

  let!(:barista) {BaristaController.new}

  describe "reduce_inventory" do
    it "reduces inventory by the specified amount" do
      barista.reduce_inventory("coffee", 1)
      expect(barista.inventory["coffee"]).to eq(9)
    end
  end

end


