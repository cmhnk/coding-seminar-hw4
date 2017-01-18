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
end
