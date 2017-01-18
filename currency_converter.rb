class CurrencyConverter
  attr_reader :hash

  def initialize(hash)
    @hash = hash
  end

  def convert(currency_object, code)
    current_currency = currency_object.code.to_sym
    current_amount = currency_object.amount

    if hash.key?(current_currency)
      divisor = hash[current_currency]
      new_amount = current_amount / divisor
      Currency.new(amount: new_amount, code: code.to_sym)
    end
  end
end
