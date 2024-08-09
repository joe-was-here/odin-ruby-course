def get_max_difference_and_index(stocks, pick)
  if stocks.length == 0
    return [0, 0]
  end
  diffs = stocks.map { |stock| pick - stock }
  max_diff = diffs.max
  max_diff_index = diffs.find_index(max_diff)
  [max_diff, max_diff_index]
end

def stock_picker(stocks)
  sell_index = nil
  buy_index = nil
  difference = nil
  while stocks.length > 0
    this_stock = stocks.pop
    this_stock_index = stocks.length
    this_max_diff, this_max_diff_index = get_max_difference_and_index(stocks, this_stock)
    if difference == nil or this_max_diff > difference
      difference = this_max_diff
      sell_index = this_stock_index
      buy_index = this_max_diff_index
    end
  end
  if difference < 1
    return []
  end
  [buy_index, sell_index]
end