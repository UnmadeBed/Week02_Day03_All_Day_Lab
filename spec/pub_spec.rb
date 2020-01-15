require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../pub.rb')
require_relative('../drink.rb')



class PubTest < MiniTest::Test
  def setup
    @pub = Pub.new('The Winchester', 1000)
    @drink1 = Drink.new('Beer', 5, 1)
    @drink2 = Drink.new('Wine', 10, 2)
    @drink3 = Drink.new('Whiskey', 15, 3)
  end

  def test_get_pub_name
    assert_equal('The Winchester', @pub.name)
  end

  def test_get_till_amount
    assert_equal(1000, @pub.till)
  end

  def test_add_drinks
    @pub.add_drink(@drink1)
    @pub.add_drink(@drink2)
    @pub.add_drink(@drink3)
    assert_equal(3, @pub.count_drinks)
  end

  def test_drink_sold
    @pub.item_sold(100)
    assert_equal(1100, @pub.till)
  end

  def test_check_stock
    assert_equal(0, @pub.check_stock)
  end

  def test_check_stock__with_stock
    @pub.add_drink(@drink1)
    @pub.add_drink(@drink2)
    @pub.add_drink(@drink3)
    @pub.add_to_stock(@pub.drinks)
    assert_equal(3, @pub.check_stock)
  end

  def test_remove_from_stocks
    @pub.add_drink(@drink1)
    @pub.add_drink(@drink2)
    @pub.add_drink(@drink3)
    @pub.add_drink(@drink1)
    @pub.add_drink(@drink2)
    @pub.add_to_stock(@pub.drinks)
    assert_equal(5, @pub.check_stock)
  end

end
