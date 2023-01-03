module Order
  class List
    attr_accessor :order_items

    def initialize(order_items: [])
      @order_items = order_items
    end

    def add_item(item:)
      @order_items.push(item)
    end
  end
end
