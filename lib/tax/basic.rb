module Tax
  class Basic
    attr_reader :item

    def initialize(item:)
      @item = item
    end

    def amount
      0.0
    end
  end
end
