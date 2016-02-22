require 'spec_helper'
require_relative '../cart'
require_relative '../two_for_one_discount'
require_relative '../product'
require_relative '../pricing_rule'

describe Cart do
  before :each do
    @cart = Cart.new(nil)
  end
  let(:kryptonite) { Product.new('KR', 'Kryptonita',  3.14) }
  let(:melange) { Product.new('ME', 'Melange', 42) }
  let(:unobtainium) { Product.new('UN', 'Unobtainium', 999) }

  describe '#initialize' do
    it 'should initialize with an empty basket' do
      expect(@cart.basket).to be_empty
    end
  end

  describe '#add' do
    it 'should add items to the basket' do
      @cart.add(kryptonite)
      expect(@cart.basket).to_not be_empty
      expect(@cart.basket.size).to eq(1)
    end
  end

  describe 'total' do
    context 'with no pricing rules' do
      context 'with one product in the basket' do
        it 'should be equal to the product price' do
          @cart.add(kryptonite)
          expect(@cart.total).to eq(kryptonite.price)
        end
      end

      context 'with various products in the basket' do
        it 'should be equal to the product prices sum' do
          @cart.add(kryptonite)
          @cart.add(melange)
          @cart.add(unobtainium)
          product_prices_sum = kryptonite.price + melange.price + unobtainium.price
          expect(@cart.total).to eq(product_prices_sum)
        end
      end
    end

    context 'with pricing_rules' do
      let(:kryponite_rule) { TwoForOneDiscount.new(kryptonite, @cart.basket, 2) }
      context 'with a 2x1 rule on a product' do
        context 'with two instances of the same product' do
          it 'should be equal to the product price' do
            2.times { @cart.add(kryptonite) }
            @cart.pricing_rules << PricingRule.new(kryponite_rule)

            expect(@cart.total).to eq(kryptonite.price)
          end
        end

        context 'with two instances of two products each' do
          it 'should be equal to the products price sum' do
            2.times { @cart.add(kryptonite) }
            2.times { @cart.add(melange) }
            @cart.pricing_rules << PricingRule.new(kryponite_rule)

            expected_total = kryptonite.price + melange.price*2
            expect(@cart.total).to eq(expected_total)
          end
        end
      end

      context 'with a 2x1 rule on two products' do
        context 'with two instances of two products each' do
          it 'should be equal to the products price sum' do
            melange_rule = TwoForOneDiscount.new(melange, @cart.basket, 2)
            2.times { @cart.add(kryptonite) }
            2.times { @cart.add(melange) }

            @cart.pricing_rules << PricingRule.new(kryponite_rule)
            @cart.pricing_rules << PricingRule.new(melange_rule)

            expected_total = kryptonite.price + melange.price
            expect(@cart.total).to eq(expected_total)
          end
        end
      end
    end
  end
end
