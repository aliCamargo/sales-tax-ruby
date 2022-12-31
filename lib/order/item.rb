module Order
  class Item
    attr_accessor :item, :quantity

    def initialize(item:, quantity: 1)
      @item = item
      @quantity = quantity
    end
  end
end
