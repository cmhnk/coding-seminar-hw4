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
  end

  def test_unequal_currencies_dif_amounts
    a = Currency.new(amount: 34, code: 'EUR')
    b = Currency.new(amount: 35, code: 'EUR')
    refute a == b
  end

  def test_unequal_currencies_dif_amounts
    a = Currency.new(amount: 34, code: 'EUR')
    b = Currency.new(amount: 34, code: 'USD')
    refute a == b
  end
end
