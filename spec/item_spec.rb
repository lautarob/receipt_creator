require_relative '../lib/item'

RSpec.describe Item do
  it 'initializes with correct attributes' do
    item = Item.new(1, 'test item', 10.00)
    expect(item.quantity).to eq(1)
    expect(item.name).to eq('test item')
    expect(item.price).to eq(10.00)
  end
end
