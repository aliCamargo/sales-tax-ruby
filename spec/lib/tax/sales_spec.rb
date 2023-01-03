describe Tax::Sales do
  let(:item) { Order::Item.new(name: 'Custom item', price: 10.0) }
  let(:calculator) { Tax::Basic.new(item: item) }
  let(:import_calculator) { Tax::Import.new(calculator: calculator) }
  let(:object) { described_class.new(calculator: calculator) }

  describe '#item' do
    it 'returns item object' do
      expect(object.item).to be(item)
    end
  end

  describe '#amount' do
    it 'returns the amount with the correct rate' do
      expect(object.amount).to be(1.0)
    end

    it 'adds the amount of the previous tax calculator' do
      test_object = described_class.new(calculator: import_calculator)
      expect(test_object.amount).to be(import_calculator.amount + object.amount)
    end
  end
end
