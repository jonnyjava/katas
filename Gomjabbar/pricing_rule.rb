class PricingRule
  attr_accessor :rule

  def initialize(rule)
    @rule = rule
  end

  def apply(total)
    (total + @rule.send(:apply)).round(2)
  end
end