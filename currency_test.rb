require 'minitest/pride'
require 'minitest/autorun'
require_relative 'currency.rb'

class CurrencyTest < Minitest::Test
  def test_currency_creation
    Currency.new(amount: 34, code: 'USD')
  end
end
