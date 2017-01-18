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

  def test_addition_same_currency
    a = Currency.new(amount: 10, code: 'USD')
    b = Currency.new(amount: 20, code: 'USD')
    assert a + b == 30
  end

  def test_addition_dif_currency
    a = Currency.new(amount: 10, code: 'USD')
    b = Currency.new(amount: 10, code: 'EUR')
    assert_raises DifferentCurrencyCodeError do
      a + b
    end
  end

  def test_multiplication_by_fixnum
    a = Currency.new(amount: 10, code: 'USD')
    b = 10
    assert a * b == Currency.new(amount: 100, code: 'USD')
  end

  def test_multiplication_by_float
    a = Currency.new(amount: 10, code: 'USD')
    b = 10.05
    assert a * b == Currency.new(amount: 100.50, code: 'USD')
  end

  def test_parse_amount
    a = Currency.new(amount_with_symbol: '$1438')
    b = Currency.new(amount: 1438, code: 'USD')
    assert a.amount = b.amount
  end
end
