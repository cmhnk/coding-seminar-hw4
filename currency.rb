class Currency

  require_relative 'custom_errors.rb'
  attr_reader :amount, :code, :amount_with_symbol
  attr_writer :amount, :code # I wanted this private, but then my tests failed

  def initialize(amount: nil, code: nil, amount_with_symbol: nil)
    @amount ||= amount
    @code ||= code
    @amount_with_symbol ||= amount_with_symbol

    if @amount_with_symbol != nil
      parse_amount_with_symbol
    end
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

  def -(other)
    if code == other.code
      amount - other.amount
    else
      raise DifferentCurrencyCodeError, "Amounts must be the same currency."
    end
  end

  def *(num)
    if num.is_a?(Fixnum) || num.is_a?(Float)
      new_amount = amount*num
      Currency.new(amount: new_amount, code: code)
    end
  end

  def parse_amount_with_symbol
    codes_symbols = {'$' => 'USD', '€' => 'EUR'}
    amount = amount_with_symbol.scan(/\d|\./).join
    symbol = amount_with_symbol[/\$|€/]
    if codes_symbols.key?(symbol)
      code = codes_symbols[symbol]
      self.amount = amount.to_f
      self.code = code
    else
      raise DifferentCurrencyCodeError, "Sorry, functionality for #{symbol} is not included yet."
    end
  end

end
# '$100'
# '€100'
