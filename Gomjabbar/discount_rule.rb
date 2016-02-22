class DiscountRule
  attr_accessor :product, :basket, :threshold

  def initialize(product, basket, threshold)
    @product = product
    @basket = basket || []
    @threshold = threshold || 1
  end
end
