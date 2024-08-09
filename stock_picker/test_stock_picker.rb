# test_stock_picker.rb

require 'minitest/autorun'
require_relative 'app'

class TestStockPicker < Minitest::Test
  def test_best_days_to_buy_and_sell
    prices = [17, 3, 6, 9, 15, 8, 6, 1, 10]
    assert_equal [1, 4], stock_picker(prices)
  end

  def test_no_profit_possible
    prices = [5, 4, 3, 2, 1]
    assert_equal [], stock_picker(prices)
  end

  def test_profit_on_last_day
    prices = [3, 10, 4, 5, 9, 1]
    assert_equal [0, 1], stock_picker(prices)
  end

  def test_single_day
    prices = [5]
    assert_equal [], stock_picker(prices)
  end

  def test_two_days_profit
    prices = [1, 5]
    assert_equal [0, 1], stock_picker(prices)
  end

  def test_large_fluctuations
    prices = [10, 22, 5, 75, 65, 80]
    assert_equal [2, 5], stock_picker(prices)
  end

  def test_identical_prices
    prices = [8, 8, 8, 8, 8]
    assert_equal [], stock_picker(prices)
  end

  def test_profit_on_first_and_last_day
    prices = [2, 4, 1, 5, 3, 8, 7, 10, 5, 4, 3, 12]
    assert_equal [2, 11], stock_picker(prices)
  end
end
