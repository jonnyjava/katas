require 'spec_helper'
require_relative '../cart'
require_relative '../two_for_one_discount'
require_relative '../three_or_more_discount'
require_relative '../product'
require_relative '../pricing_rule'

describe "Gom Jabbar" do

  before :each do
    @cart = Cart.new(nil)
    kryponite_rule = TwoForOneDiscount.new(kryptonite, @cart.basket, 2)
    melange_rule = ThreeOrMoreDiscount.new(melange, @cart.basket, 3, 33.33)
    @cart.pricing_rules << PricingRule.new(kryponite_rule)
    @cart.pricing_rules << PricingRule.new(melange_rule)
  end
  let(:kryptonite) { Product.new('KR', 'Kryptonita',  3.14) }
  let(:melange) { Product.new('ME', 'Melange', 42) }
  let(:unobtainium) { Product.new('UN', 'Unobtainium', 999) }

  context 'example one' do
    it 'should return 1047.28' do
      @cart.add(kryptonite)
      @cart.add(melange)
      @cart.add(kryptonite)
      @cart.add(kryptonite)
      @cart.add(unobtainium)
      expect(@cart.total).to eq(1047.28)
    end
  end

  context 'example two' do
    it 'should return 3.14' do
      @cart.add(kryptonite)
      @cart.add(kryptonite)
      expect(@cart.total).to eq(3.14)
    end
  end

  context 'example three' do
    it 'should return 103.13' do
      @cart.add(melange)
      @cart.add(melange)
      @cart.add(kryptonite)
      @cart.add(melange)
      expect(@cart.total).to eq(103.13)
    end
  end
end
