# Shopping Basket

This is a simple Ruby program that simulates a shopping basket and calculates sales taxes on items. It's designed to handle different types of products and apply the appropriate taxes based on certain rules.

## Features

- Add items to the shopping basket with quantity, name, and price.
- Calculate sales tax for items based on their type (exempt or imported).
- Generate a receipt that lists items, their prices, and the total cost, including taxes.
- Round sales tax to the nearest 0.05 for each item.
- Format numbers with two decimal places in the output.

## Usage

To use this program, you can create a `ShoppingBasket` object and add items to it using the `add_item` method. Then, you can generate a receipt using the `generate_receipt` method.

Here's an example of how to use it:

```ruby
# Example usage

basket1 = ShoppingBasket.new
basket1.add_item(2, 'book', 12.49)
basket1.add_item(1, 'music CD', 14.99)
basket1.add_item(1, 'chocolate bar', 0.85)

basket1.generate_receipt

## Testing

This program includes RSpec tests to ensure that it calculates sales tax and generates correct receipts for different scenarios. To run the tests, follow these instructions:

1. Clone this repository to your local machine:

   ```shell
   git clone https://github.com/your-username/shopping-basket.git

2. Change to the project directory:

   ```shell
   cd shopping-basket

3. Install the required RSpec gem if you haven't already:

   ```shell
   gem install rspec

4. Run the tests using the following command:

   ```shell
   rspec test.rb
