require_relative 'discount_rule'

class TwoForOneDiscount < DiscountRule

  def apply
    discountable_products = @basket.count(@product) / @threshold
    discount_amount(discountable_products)
  end

  private

  def discount_amount(discountable_products)
    discountable_products * @product.price*-1
  end
end
