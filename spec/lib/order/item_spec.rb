describe Order::Item do
  let(:item) { described_class.new(name: 'Item name', price: 10.0) }

  describe '#initialize' do
    it 'inits with corrects values' do
      expect(item.name).to eq('Item name')
      expect(item.price).to be(10.0)
    end

    it 'sets defaul values when its initailize with name and price' do
      expect(item.category).to eq(Order::Item::Category::DEFAULT)
      expect(item.is_imported).to be_falsey
    end
  end

  describe '#price_with_tax' do
    it 'returns the value of the price with taxes included' do
      item = described_class.new(
        name: 'Item name',
        price: 11.25,
        quantity: 3,
        category: Order::Item::Category::FOOD,
        is_imported: true
      )

      expect(item.price_with_tax).to be(35.55)
    end
  end

  describe '#total_price' do
    it 'returns the value of the price according to quantity' do
      item = described_class.new(
        name: 'Item name',
        price: 11.28,
        quantity: 3,
        category: Order::Item::Category::FOOD,
        is_imported: true
      )
      expect(item.total_price).to be(33.84)
    end
  end

  describe '#to_s' do
    it 'returns the output string including "imported", when is an imported item' do
      item = described_class.new(name: 'Item name', price: 10, is_imported: true)
      expect(item.to_s).to eq('1 imported Item name: 11.5')
    end

    it 'returns the output string without "imported", when is not an imported item' do
      item = described_class.new(name: 'Item name', price: 10)
      expect(item.to_s).to eq('1 Item name: 11.0')
    end
  end

  describe '#tax' do
    it 'calculates sales tax when the category is DEFAULT' do
      described_class.new(name: 'Item name', price: 11.28, quantity: 3, is_imported: true,)
      expect(item.tax).to be(1.0)
    end

    it 'calculates import tax when the item is imported' do
      item = described_class.new(name: 'Item name', price: 10.0, category: Order::Item::Category::FOOD, is_imported: true)

      expect(item.tax).to be(0.5)
    end

    it 'calculates sales tax and import tax when the item is imported and the category is DEFAULT' do
      item = described_class.new(name: 'Item name', price: 10.0, is_imported: true)

      expect(item.tax).to be(1.5)
    end

    it 'avoids sales tax and import tax when the category is different from DEFAULT and is_imported is false' do
      item = described_class.new(name: 'Item name', price: 10.0, category: Order::Item::Category::FOOD)

      expect(item.tax).to be(0.0)
    end
  end
end
