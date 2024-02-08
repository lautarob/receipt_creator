module TaxCalculator
  BASIC_SALES_TAX_RATE = 0.10
  IMPORT_DUTY_RATE = 0.05
  EXEMPT_ITEMS = ['book', 'chocolate bar', 'headache pills', 'chocolates']

  def self.calculate(item)
    sales_tax = 0.0
    sales_tax += item.price * BASIC_SALES_TAX_RATE unless exempt?(item.name)
    sales_tax += item.price * IMPORT_DUTY_RATE if item.name.include?('imported')
    round_tax(sales_tax)
  end

  def self.exempt?(item_name)
    EXEMPT_ITEMS.any? { |exempt| item_name.include?(exempt) }
  end

  private

  def self.round_tax(amount)
    (amount * 20).ceil / 20.0
  end
end
