require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../customer.rb')
require_relative('../pub.rb')
require_relative('../drink.rb')
require_relative('../food.rb')



class CustomerTest < MiniTest::Test

def setup
  @customer = Customer.new('Niall', 300, 60)
  @customer2 = Customer.new('Robbie', 20, 16)
  @pub = Pub.new('The Winchester', 1000)
  @drink1 = Drink.new('Beer', 5, 1)
  @drink2 = Drink.new('Wine', 10, 2)
  @food1 = Food.new('Pizza', 10, 2)
end

def test_get_customers_name
  assert_equal('Niall', @customer.name)
end

def test_get_wallet_amount
  assert_equal(300, @customer.wallet)
end

def test_take_money_from_wallet
  @customer.charged(100)
  assert_equal(200, @customer.wallet)
end

def test_buy_drink
  @pub.add_drink(@drink1)
  @pub.add_drink(@drink2)
  @customer.buy_drink(@pub, @drink2)
  assert_equal(290, @customer.wallet)
  assert_equal(1010, @pub.till)
end

def test_buy_drink__drink_not_available
  @customer.buy_drink(@pub, @drink1)
  assert_equal(300, @customer.wallet)
  assert_equal(1000, @pub.till)
end

def test_buy_drink__under_age
  @pub.add_drink(@drink1)
  @customer2.buy_drink(@pub, @drink1)
  assert_equal(20, @customer2.wallet)
  assert_equal(1000, @pub.till)
end

def test_get_customers_age
  assert_equal(60, @customer.age)
end

def test_customer_too_drunk
  @pub.add_drink(@drink1)
  @customer.increased_drunkness(5)
  @customer.buy_drink(@pub, @drink1)
  assert_equal(300, @customer.wallet)
  assert_equal(1000, @pub.till)
end

def test_increase_drunkeness
  @pub.add_drink(@drink1)
  @customer.buy_drink(@pub, @drink1)
  assert_equal(1, @customer.drunkeness)
end

def test_buy_food
  @customer.increased_drunkness(3)
  @customer.buy_food(@pub, @food1)
  assert_equal(1, @customer.drunkeness)
  assert_equal(290, @customer.wallet)
  assert_equal(1010, @pub.till)
end

end
