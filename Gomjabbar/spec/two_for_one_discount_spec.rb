require 'spec_helper'
require_relative '../two_for_one_discount'
require_relative '../product'

describe TwoForOneDiscount do
  before :each do
    @product = Product.new('KR', 'Kryptonita',  3.14)
    @discount = TwoForOneDiscount.new(@product, nil, 2)
  end

  describe '#apply' do
    context 'with no products' do
      it 'should return a total equal to 0' do
        expect(@discount.apply).to eq(0)
      end
    end
    context 'with only one instance of the product' do
      it 'should return a discount equal to 0' do
        @discount.basket << @product
        expect(@discount.apply).to eq(0)
      end
    end
    context 'with exactly 2 instances of the product' do
      it "should return a discount equal to the price of one product" do
        2.times{@discount.basket << @product}
        expect(@discount.apply).to eq(-@product.price)
      end
    end
    context 'with more than 2 instances of the product' do
      it 'should return a discount equal to the prices of half product count (rounded to previous integer)' do
        5.times{@discount.basket << @product}
        expect(@discount.apply).to eq(@product.price*-2)
      end
    end
  end
end
