# Shopping Basket

This Ruby application simulates a shopping basket, designed to manage purchases and calculate sales taxes according to specific rules. It elegantly handles tax calculations for both exempt and non-exempt items, including imported goods, ensuring accurate billing and receipt generation.

## Features

- **Item Management**: Add items with quantity, name, and price.
- **Tax Calculation**: Automatically calculates sales tax for items, distinguishing between exempt, non-exempt, and imported products.
- **Receipt Generation**: Produces a detailed receipt that includes each item's final price (tax inclusive) and the total cost.
- **Tax Rounding**: Rounds sales tax to the nearest 0.05 for precise accounting.
- **Formatted Output**: Ensures all numbers are presented with two decimal places for readability.

## Installation

No installation is necessary for running this program directly. However, ensure Ruby is installed on your system. This program was developed and tested with Ruby 3.0.0, but it should be compatible with most recent Ruby versions.

## Usage

The `ShoppingBasket` class is at the core of this application. You can instantiate this class and use its methods to simulate a shopping experience.

Here's a quick start guide:

```ruby
require_relative 'path/to/lib/shopping_basket'

# Initialize a new Shopping Basket
basket = ShoppingBasket.new

# Add items to the basket
basket.add_item(1, 'imported bottle of perfume', 27.99)
basket.add_item(1, 'bottle of perfume', 18.99)
basket.add_item(1, 'packet of headache pills', 9.75)
basket.add_item(1, 'imported box of chocolates', 11.25)

# Generate and print the receipt to STDOUT
basket.generate_receipt
```

# Testing

Comprehensive RSpec tests are included to verify functionality across different scenarios, from tax calculations to receipt generation.

## Running Tests

To run the tests, ensure you have RSpec installed. If not, you can install it with:

Install the required RSpec gem if you haven't already:

   ```shell
   gem install rspec
   ```

Then Clone this repository to your local machine:
   ```shell
   git clone https://github.com/lautarob/receipt_creator.git
   ```

Change to the project directory:

   ```shell
   cd receipt_creator
   ```

Run the tests using the following command:

   ```shell
   rspec
   ```

This will run all spec files located in the spec directory, providing a detailed report of each test case.
