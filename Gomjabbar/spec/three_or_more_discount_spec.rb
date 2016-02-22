require 'spec_helper'
require_relative '../three_or_more_discount'
require_relative '../product'

describe ThreeOrMoreDiscount do
  before :each do
    @product = Product.new('ME', 'Melange',  42)
    @new_price = 33.33
    @discount = ThreeOrMoreDiscount.new(@product, [], 3, @new_price)
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
    context 'with 3 or more instances of the product' do
      it 'should return a discount equal to the difference between the old and the new price for each product' do
        3.times{@discount.basket << @product}
        expected_result = ((@product.price-@new_price)*3).round(2)
        expect(@discount.apply).to eq(-expected_result)
      end
    end
  end
end
