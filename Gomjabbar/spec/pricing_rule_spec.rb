require 'spec_helper'
require_relative '../two_for_one_discount'
require_relative '../pricing_rule'
require_relative '../product'

describe PricingRule do
  before :each do
    @product = Product.new('KR', 'Kryptonita',  3.14)
    @discount = TwoForOneDiscount.new(@product, [@product, @product], 2)
    @pricing_rule = PricingRule.new(@discount)
  end

  describe '#initialize' do
    it 'should have a rule of class TwoForOneDiscount' do
      expect(@pricing_rule.rule.class).to be(TwoForOneDiscount)
    end
  end

  describe '#apply' do
    it 'should call the apply method' do
      expect_any_instance_of(TwoForOneDiscount).to receive(:apply).and_return(@product.price)
      @pricing_rule.apply(666)
    end
  end
end
