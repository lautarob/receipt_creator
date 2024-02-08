require_relative '../lib/item'
require_relative '../lib/tax_calculator'

RSpec.describe TaxCalculator do
  it 'calculates correct tax for exempt items' do
    exempt_item = Item.new(1, 'book', 12.49)
    expect(TaxCalculator.calculate(exempt_item)).to eq(0.0)
  end

  it 'calculates correct tax for non-exempt items' do
    non_exempt_item = Item.new(1, 'music CD', 14.99)
    expect(TaxCalculator.calculate(non_exempt_item)).to be_within(0.05).of(1.5)
  end

  it 'calculates correct import duty for imported items' do
    imported_item = Item.new(1, 'imported chocolates', 10.00)
    expect(TaxCalculator.calculate(imported_item)).to be_within(0.05).of(0.5)
  end
end
