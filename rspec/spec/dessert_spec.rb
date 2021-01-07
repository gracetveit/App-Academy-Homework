require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:dessert) { Dessert.new("sweet", 20, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to_not eq(nil)
    end
    
    it "sets a quantity" do
      expect(dessert.quantity).to_not eq(nil)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("Hello", "world", chef)}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("Love")
      expect(dessert.ingredients).to eq(["Love"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      expect(dessert.ingredients).to receive(:shuffle!)
      dessert.mix!
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(1)
      expect(dessert.quantity).to eq(19)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { dessert.eat(50) }.to raise_error(StandardError)
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Grace Tveit")
      expect(chef).to receive(:titleize)
      dessert.serve
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      allow(chef).to receive(:bake).with(dessert).and_return(dessert.heat!)
      expect(chef).to receive(:bake)
      dessert.make_more
      expect(dessert.temp).to eq(400)
    end
  end
end
