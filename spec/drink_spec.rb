require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new


require_relative('../drink.rb')

class DrinkTest < MiniTest::Test
  def setup
    @drink1 = Drink.new('Beer', 5, 1)
  end

  def test_get_drink
    assert_equal('Beer', @drink1.name)
  end

  def test_get_price
    assert_equal(5, @drink1.price)
  end

end
