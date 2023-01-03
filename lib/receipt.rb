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
    @total_price
  end

  def print
    @order_list.order_items.each do |item|
      tax = item.tax
      price = item.price_with_tax
      @total_price += price
      @total_tax += tax

      puts item.to_s
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
