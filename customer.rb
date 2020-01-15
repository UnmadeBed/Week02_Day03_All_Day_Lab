class Customer
  attr_reader :name, :wallet, :age
  attr_accessor :drunkeness

  def initialize(name, wallet, age)

    @name = name
    @wallet = wallet
    @age = age
    @drunkeness = 0
  end

  def charged(value)
    @wallet -= value
  end

  def increased_drunkness(value)
    @drunkeness += value
  end

  def buy_drink(pub, request)
    if age > 18 && drunkeness < 4
      for drink in pub.get_drinks
        if drink == request
          charged(drink.price)
          pub.item_sold(drink.price)
          increased_drunkness(drink.alcohol_level)
          pub.remove_stock(drink)
        end
      end
    end
    return nil
  end

  def buy_food(pub, food)
    if food != nil
      increased_drunkness(-food.rejuvenation_level)
      charged(food.price)
      pub.item_sold(food.price)
    end
  end


end
