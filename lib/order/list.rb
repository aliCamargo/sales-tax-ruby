module Order
  class List
    attr_accessor :order_items

    def initialize(order_items: [])
      @order_items = order_items
    end

    def add_item(item:, quantity: 1)
      @order_items.push(Order::Item.new(item: item, quantity: quantity))
    end
  end
end
