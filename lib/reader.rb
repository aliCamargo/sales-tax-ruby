class Reader
  def initialize(input:)
    @input = input
    @counter = 1
  end

  def input=(value)
    @input = value
    @counter += 1
  end

  def output
    ol = Order::List.new

    @input.each do |input_item|
      item = _to_item(input_item)
      ol.add_item(item: item)
    end

    receipt = Receipt.new(order_list: ol)

    puts ''
    puts "Output #{@counter}:"
    receipt.print
    puts ''
  end

  private

  def _category(name)
    if name.include?('pill')
      Order::Item::Category::MEDICAL
    elsif name.include?('book')
      Order::Item::Category::BOOK
    elsif name.include?('chocolate')
      Order::Item::Category::FOOD
    else
      Order::Item::Category::DEFAULT
    end
  end

  def _to_item(input_item)
    detail = input_item.split(' ')
    quantity = detail.slice!(0).to_i
    price = detail.slice!(-1).to_f
    detail.slice!(-1) # Remove "at"
    name = detail.join(' ')
    is_imported = detail.include?('imported')
    category = _category(name)

    Order::Item.new(name: name, price: price, quantity: quantity, category: category, is_imported: is_imported)
  end
end
