module Order
  class Item
    module Category
      BOOK = :book
      FOOD = :food
      MEDICAL = :medical
      DEFAULT = :default
    end

    attr_accessor :name, :category, :is_imported, :price, :quantity

    def initialize(name:, price:, quantity: 1, category: Category::DEFAULT, is_imported: false)
      @name = name
      @category = category
      @is_imported = is_imported
      @price = price
      @quantity = quantity
    end

    def price_with_tax
      total_price + tax
    end

    def total_price
      (price * quantity).round(2)
    end

    def to_s
      "#{quantity} #{'imported ' if is_imported}#{name}: #{price_with_tax.round(2)}"
    end

    def exempt?
      category != Order::Item::Category::DEFAULT
    end

    def tax
      calculator = Tax::Basic.new(item: self)
      calculator = Tax::Sales.new(calculator: calculator) unless exempt?
      calculator = Tax::Import.new(calculator: calculator) if is_imported
      _round(calculator.amount) * quantity
    end

    private

    def _precision
      0.05
    end

    def _round(number)
      (number * (1 / _precision)).ceil / (1 / _precision)
    end
  end
end
