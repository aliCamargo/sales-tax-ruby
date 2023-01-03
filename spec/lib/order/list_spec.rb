describe Order::List do
  let(:item) { Order::Item.new(name: 'Custom item', price: 10.0) }
  let(:item2) { Order::Item.new(name: 'Custom item2', price: 20.0) }
  let(:object) { described_class.new }

  describe '#add_item' do
    it 'sets default quantity value' do
      object.add_item(item: item)
      expect(object.order_items.first.quantity).to be(1)
    end

    it 'chnages size of the order items list' do
      expect do
        object.add_item(item: item)
        object.add_item(item: item2)
      end.to change { object.order_items.size }.by(2)
    end
  end
end
