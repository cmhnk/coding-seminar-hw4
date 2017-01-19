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
      current_amount_rate = hash[current_currency]
      new_amount_rate = hash[new_code]
      converted_amount = current_amount * (new_amount_rate / current_amount_rate)
      Currency.new(amount: converted_amount, code: new_code)
    else
      raise UnknownCurrencyCodeError
    end
  end
end
