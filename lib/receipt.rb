class Receipt
  attr_reader :order_list

  def initialize(order_list:)
    @order_list = order_list
    @total_price = 0
    @total_tax = 0
  end

  def sales_tax
    _round(@total_tax)
  end

  def total
    @total_price.round(2)
  end

  def print
    @order_list.order_items.each do |order_item|
      item = order_item.item
      tax = item.tax * order_item.quantity
      tax = item.is_imported || !item.exempt? ? _round(tax) : tax.round(2)
      price = item.price * order_item.quantity + tax

      @total_price += price
      @total_tax += tax

      puts "#{order_item.quantity} #{'imported ' if item.is_imported}#{item.name}: #{price.round(2)}"
    end

    puts "#{'-' * 25}\nSales Taxes: #{sales_tax}\nTotal: #{total}"
  end

  private

  def _precision
    0.05
  end

  def _round(number)
    (number * (1 / _precision)).round / (1 / _precision)
  end
end
