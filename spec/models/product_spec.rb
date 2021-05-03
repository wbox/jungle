require 'rails_helper'

# RSpec.describe Product, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

RSpec.describe Product, type: :model do

  before do
    category = Category.new(:name => 'Bla')
    category.save!
    @product = category.products.create!({name: 'Product Test', price: '12345', quantity: 10})

    # Do I need a @product.save! here?

    # For the .error.full_messages, if I add @products.errors.full_messages array do I need to change the model or the class?
    # def create
    #   @product = Product.new(product_params)
  
    #   if @product.save
    #     redirect_to [:admin, :products], notice: 'Product created!' -> can the "notice:" be used on the tests?
    #   else
    #     render :new
    #   end
    # end
  

  end
  
  describe 'Validations' do

    it 'product is created' do
      expect(@product.name).to eql('Product Test')
    end

    it 'product is created with correct product name (Product Test)' do
      expect(@product.name).to eql ('Product Test')
    end

    it 'product is created with price' do
      expect(@product.price).to_not be nil
    end

    it 'product is created with quantity' do
      expect(@product.quantity).to be >= 0
    end

    it 'product is created with category not being null' do
      expect(@product.category).to_not be nil
    end

  end
end