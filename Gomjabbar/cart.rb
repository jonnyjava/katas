class Cart
  extend Forwardable

  attr_accessor :pricing_rules, :basket
  def_delegator :@basket, :<<, :add

  def initialize(pricing_rules)
    @pricing_rules = (pricing_rules || [])
    @basket = []
  end

  def total
    total = @basket.inject(0){ |total, product| total + product.price }
    apply_pricing_rules(total)
  end

  private

  def apply_pricing_rules(total)
    @pricing_rules.each do |pricing_rule|
      total = pricing_rule.apply(total)
    end
    total
  end
end
