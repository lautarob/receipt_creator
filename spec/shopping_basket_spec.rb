require_relative '../lib/shopping_basket'
require_relative '../lib/item'
require 'rspec'

RSpec.describe ShoppingBasket do
  describe '#generate_receipt' do
    let(:basket) { ShoppingBasket.new }

    context 'Input 1' do
      before do
        basket.add_item(2, 'book', 12.49)
        basket.add_item(1, 'music CD', 14.99)
        basket.add_item(1, 'chocolate bar', 0.85)
      end

      it 'outputs correct receipt details' do
        expected_receipt = <<~RECEIPT
          2 book: 24.98
          1 music CD: 16.49
          1 chocolate bar: 0.85
          Sales Taxes: 1.50
          Total: 42.32
        RECEIPT
        expect { basket.generate_receipt }.to output(expected_receipt).to_stdout
      end
    end

    context 'Input 2' do
      before do
        basket.add_item(1, 'imported box of chocolates', 10.00)
        basket.add_item(1, 'imported bottle of perfume', 47.50)
      end

      it 'outputs correct receipt details for imported items' do
        expected_receipt = <<~RECEIPT
          1 imported box of chocolates: 10.50
          1 imported bottle of perfume: 54.65
          Sales Taxes: 7.65
          Total: 65.15
        RECEIPT
        
        expect { basket.generate_receipt }.to output(expected_receipt).to_stdout
      end
    end

    context 'Input 3' do
      before do
        basket.add_item(1, 'imported bottle of perfume', 27.99)
        basket.add_item(1, 'bottle of perfume', 18.99)
        basket.add_item(1, 'packet of headache pills', 9.75)
        basket.add_item(3, 'imported boxes of chocolates', 11.25)
      end

      it 'outputs correct receipt details for a mixed basket' do
        expected_receipt = <<~RECEIPT
          1 imported bottle of perfume: 32.19
          1 bottle of perfume: 20.89
          1 packet of headache pills: 9.75
          3 imported boxes of chocolates: 35.55
          Sales Taxes: 7.90
          Total: 98.38
        RECEIPT
        expect { basket.generate_receipt }.to output(expected_receipt).to_stdout
      end
    end
  end
end
