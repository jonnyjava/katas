require_relative 'discount_rule'

class ThreeOrMoreDiscount < DiscountRule
  attr_accessor :new_price
  def initialize(product, basket, threshold, new_price)
    super(product, basket, threshold)
    @new_price = new_price
  end

  def apply
    count_product_in_basket = @basket.count(@product)
    count_product_in_basket >= @threshold ? discount_amount(count_product_in_basket) : 0
  end

  private
  def price_difference
    @product.price - @new_price
  end

  def discount_amount(discountable_products)
    (price_difference * discountable_products * -1).round(2)
  end
end
