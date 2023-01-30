require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    
    before do
      @category = Category.create(name: "test-category")
    end

    subject {
      @product = Product.create(
        name: "test-product",
        price: 100,
        quantity: 10,
        category: @category
      )
    }

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

  end
end
