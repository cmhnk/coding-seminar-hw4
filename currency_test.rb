require 'minitest/pride'
require 'minitest/autorun'
require_relative 'currency.rb'

class CurrencyTest < Minitest::Test
  def test_currency_creation
    Currency.new(amount: 34, code: 'USD')
  end

  def test_equal_currencies
    a = Currency.new(amount: 34, code: 'USD')
    b = Currency.new(amount: 34, code: 'USD')
    # the thing that comes after assert needs to be true
    assert a == b

    c = Currency.new(amount: 34, code: 'EUR')
    # refute means that the thing that comes after must be falsy
    refute a == c
  end
end
