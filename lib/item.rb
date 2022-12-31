class Item
  module Category
    BOOK = :book
    FOOD = :food
    MEDICAL = :medical
    DEFAULT = :default
  end

  attr_accessor :name, :category, :is_imported, :price

  def initialize(name:, price:, category: Category::DEFAULT, is_imported: false)
    @name = name
    @category = category
    @is_imported = is_imported
    @price = price
  end

  def exempt?
    category != ::Item::Category::DEFAULT
  end

  def tax
    calculator = Tax::Basic.new(item: self)
    calculator = Tax::Sales.new(calculator: calculator) unless exempt?
    calculator = Tax::Import.new(calculator: calculator) if is_imported
    calculator.amount
  end
end
