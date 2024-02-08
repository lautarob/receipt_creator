require_relative 'item'
require_relative 'tax_calculator'

class ShoppingBasket
  def initialize
    @items = []
  end

  def add_item(quantity, name, price)
    @items << Item.new(quantity, name, price)
  end

  def generate_receipt
    total_sales_tax = 0.0
    total_price = 0.0

    @items.each do |item|
      sales_tax = TaxCalculator.calculate(item)
      total_item_price = (item.price + sales_tax) * item.quantity
      total_sales_tax += sales_tax * item.quantity
      total_price += total_item_price

      puts "#{item.quantity} #{item.name}: #{'%.2f' % total_item_price}"
    end

    puts "Sales Taxes: #{'%.2f' % total_sales_tax}"
    puts "Total: #{'%.2f' % total_price}"
  end
end
