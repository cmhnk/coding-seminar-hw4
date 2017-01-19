class CurrencyConverter
  require_relative './custom_errors.rb'
  attr_reader :hash

  def initialize(hash)
    @hash = hash
  end

  def convert(currency_object, desired_currency)
    current_currency = currency_object.code
    current_amount = currency_object.amount
    new_code = desired_currency.to_sym
    if hash.key?(current_currency) && hash.key?(new_code)
      divisor = hash[current_currency]
      new_amount = current_amount / divisor
      Currency.new(amount: new_amount, code: new_code)
    else
      raise UnknownCurrencyCodeError
    end
  end
end
