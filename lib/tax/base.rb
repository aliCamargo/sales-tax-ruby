module Tax
  class Base
    def initialize(calculator:)
      @calculator = calculator
    end

    def item
      @calculator.item
    end

    def amount
      @calculator.amount + item.price * _rate
    end

    protected

    def _rate
      0.0
    end
  end
end
