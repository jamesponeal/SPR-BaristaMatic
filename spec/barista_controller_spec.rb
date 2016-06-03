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
      expect(barista.get_cost("Coffee")).to eq('2.75')
    end

    it "returns the cost of a specified menu item" do
      expect(barista.get_cost("Caffe Latte")).to eq('2.55')
    end

    it "returns the cost of a specified menu item" do
      expect(barista.get_cost("Caffe Americano")).to eq('3.30')
    end

    it "returns the cost of a specified menu item" do
      expect(barista.get_cost("Cappuccino")).to eq('2.90')
    end
  end

  describe "enough_inventory?" do
    it "returns true if there is enough inventory to make the requested item" do
      expect(barista.enough_inventory?("Coffee")).to be true
    end

    it "returns false if there is not enough inventory to make requested item" do
      barista.reduce_inventory("Coffee", 9)
      expect(barista.enough_inventory?("Coffee")).to be false
    end
  end

  describe "replenish_inventory" do
    it "returns all inventory to the starting value" do
      barista.reduce_inventory("Coffee", 1)
      barista.replenish_inventory
      expect(barista.inventory["Coffee"]).to eq(10)
    end
  end

  describe "get_menu" do
    it "returns an array containing menu of available drinks" do
      expect(barista.get_menu).to eq(["1,Coffee,$2.75,true", "2,Decaf Coffee,$2.75,true", "3,Caffe Latte,$2.55,true", "4,Caffe Americano,$3.30,true", "5,Caffe Mocha,$3.35,true", "6,Cappuccino,$2.90,true"])
    end
  end

  describe "get_drink_name" do
    it "returns the name of drink given a string number" do
      expect(barista.get_drink_name("1")).to eq("Coffee")
    end

    it "returns the name of drink given a string number" do
      expect(barista.get_drink_name("6")).to eq("Cappuccino")
    end
  end

  describe "valid_choice?" do
    it "returns true if the choice input is valid" do
      expect(barista.valid_choice?("Q")).to be true
    end

    it "returns false if the choice input is invalid" do
      expect(barista.valid_choice?("7")).to be false
    end
  end

end


