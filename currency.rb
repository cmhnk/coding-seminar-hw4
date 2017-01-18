class Currency

  require_relative 'different_currency_code_error.rb'
  attr_reader :amount, :code

  def initialize(amount:, code:)
    @amount = amount
    @code = code
  end

  def ==(other)
    @amount == other.amount && @code == other.code
  end

  def +(other)
    if code == other.code
      amount + other.amount
    else
      raise DifferentCurrencyCodeError, "Amounts must be the same currency."
    end
  end
end
