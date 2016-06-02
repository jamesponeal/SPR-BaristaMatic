require_relative '../barista_controller'

describe "BaristaController" do

  let!(:barista) {BaristaController.new}

  describe "reduce_inventory" do
    it "reduces inventory by the specified amount" do
      barista.reduce_inventory("Coffee", 1)
      expect(barista.inventory["Coffee"]).to eq(9)
    end

    it "reduces inventory by the specified amount" do
      barista.reduce_inventory("Sugar", 3)
      expect(barista.inventory["Sugar"]).to eq(7)
    end
  end

  describe "get_cost" do
    it "returns the cost of a specified menu item" do
      expect(barista.get_cost("Coffee")).to eq(2.75)
    end

    it "returns the cost of a specified menu item" do
      expect(barista.get_cost("Caffe Latte")).to eq(2.55)
    end

    it "returns the cost of a specified menu item" do
      expect(barista.get_cost("Caffe Americano")).to eq(3.3)
    end

    it "returns the cost of a specified menu item" do
      expect(barista.get_cost("Cappuccino")).to eq(2.9)
    end
  end

end


