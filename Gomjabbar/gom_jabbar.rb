class GomJabbar
  attr_accessor :products, :cart, :pricing_rules
  def initialize
    @products = products
    @pricing_rules = []
  end

  def create_cart
    cart = Cart.new(@pricing_rules)
  end

  def create_pricing_rules
    @pricing_rules = []
  end

  def purchase
    @chart.total
  end
end
