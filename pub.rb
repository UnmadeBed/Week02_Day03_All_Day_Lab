class Pub
  attr_reader :name, :till, :stocks, :drinks

  def initialize(name, till)
    @name = name
    @till = till
    @drinks = []
    @stocks = {}
  end

  def add_drink(booze)
    @drinks.push(booze)
  end

  def count_drinks
    return @drinks.count
  end

  def get_drinks
    return @drinks
  end

  def item_sold(value)
    @till += value
  end

  def check_stock
    return @stocks.count
  end

  def add_to_stock(drinks)
    for booze in drinks
      if @stocks.include?(booze)
        @stocks[booze] += 1
      else
        @stocks[booze] = 1
      end
    end
  end

  def remove_stock(drink)
      if @stocks.include?(drink)
        @stocks[drink] -= 1
      end
  end

end
