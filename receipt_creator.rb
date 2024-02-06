class ShoppingBasket
  def initialize
    @items = []
  end

  def add_item(quantity, name, price)
    @items << { quantity: quantity, name: name, price: price }
  end

  def calculate_sales_tax(item)
    sales_tax = 0.0
    basic_sales_tax = item[:price] * 0.1 unless exempt?(item[:name])
    import_duty = item[:price] * 0.05 if item[:name].include?('imported')
    sales_tax = basic_sales_tax.to_f + import_duty.to_f
    rounded_sales_tax = (sales_tax * 20).ceil / 20.0
    rounded_sales_tax
  end

  def generate_receipt
    total_sales_tax = 0.0
    total_price = 0.0
  
    @items.each do |item|
      sales_tax = calculate_sales_tax(item)
      total_sales_tax += sales_tax * item[:quantity]
      total_price += (item[:price] + sales_tax) * item[:quantity]
      items_total = '%.2f' % ((item[:price] + sales_tax) * item[:quantity])
  
      puts "#{item[:quantity]} #{item[:name]}: #{items_total}"
    end
  
    sales_tax_total = '%.2f' % total_sales_tax
    total = '%.2f' % total_price
  
    puts "Sales Taxes: #{sales_tax_total}"
    puts "Total: #{total}"
  end

  private

  def exempt?(item_name)
    exempt_items = ['book', 'chocolate bar', 'headache pills', 'chocolates']
    exempt_items.any? { |exempt| item_name.include?(exempt) }
  end
end


RSpec.describe ShoppingBasket do
  it 'calculates sales tax correctly' do
    basket = ShoppingBasket.new
    basket.add_item(1, 'book', 12.49)
    expect(basket.calculate_sales_tax({ quantity: 1, name: 'book', price: 12.49 })).to eq(0.0)

    basket.add_item(1, 'music CD', 14.99)
    expect(basket.calculate_sales_tax({ quantity: 1, name: 'music CD', price: 14.99 })).to eq(1.5)

    basket.add_item(1, 'chocolate bar', 0.85)
    expect(basket.calculate_sales_tax({ quantity: 1, name: 'chocolate bar', price: 0.85 })).to eq(0.0)

    basket.add_item(1, 'imported box of chocolates', 10.00)
    expect(basket.calculate_sales_tax({ quantity: 1, name: 'imported box of chocolates', price: 10.00 })).to eq(0.5)
  end

  it 'generates correct receipt for Input 1' do
    basket1 = ShoppingBasket.new
    basket1.add_item(2, 'book', 12.49)
    basket1.add_item(1, 'music CD', 14.99)
    basket1.add_item(1, 'chocolate bar', 0.85)

    expect { basket1.generate_receipt }.to output("2 book: 24.98\n1 music CD: 16.49\n1 chocolate bar: 0.85\nSales Taxes: 1.50\nTotal: 42.32\n").to_stdout
  end

  it 'generates correct receipt for Input 2' do
    basket2 = ShoppingBasket.new
    basket2.add_item(1, 'imported box of chocolates', 10.00)
    basket2.add_item(1, 'imported bottle of perfume', 47.50)

    expect { basket2.generate_receipt }.to output("1 imported box of chocolates: 10.50\n1 imported bottle of perfume: 54.65\nSales Taxes: 7.65\nTotal: 65.15\n").to_stdout
  end

  it 'generates correct receipt for Input 3' do
    basket3 = ShoppingBasket.new
    basket3.add_item(1, 'imported bottle of perfume', 27.99)
    basket3.add_item(1, 'bottle of perfume', 18.99)
    basket3.add_item(1, 'packet of headache pills', 9.75)
    basket3.add_item(3, 'imported boxes of chocolates', 11.25)

    expect { basket3.generate_receipt }.to output("1 imported bottle of perfume: 32.19\n1 bottle of perfume: 20.89\n1 packet of headache pills: 9.75\n3 imported boxes of chocolates: 35.55\nSales Taxes: 7.90\nTotal: 98.38\n").to_stdout
  end
end
