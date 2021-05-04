require 'rails_helper'

# RSpec.describe Product, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

RSpec.describe Product, type: :model do

  before do
    @category = Category.new(:name => 'Bla')
    @category.save
    
    # @p = category.products.create({ price: '12345', quantity: 10})
    # p @p.errors.full_messages

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

    it "sucessfully create a new product when product name is provided" do
      product = @category.products.create({name: 'New Product', price: '12345', quantity: 10})
      expect(product.errors.full_messages).to_not include("Name can't be blank")
    end

    it "fail to create a new product when product name is not provided" do
      product = @category.products.create({name: nil, price: '12345', quantity: 10})
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it "sucessfully create a new product when product price is provided" do
      product = @category.products.create({name: 'New Product', price: '12345', quantity: 10})
      expect(product.errors.full_messages).to_not include ("Price can't be blank")
    end

    it "fail to create a new product when product price is not provided" do
      product = @category.products.create({name: 'New Product', price: nil, quantity: 10})
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

    it "sucessfully create a new product when product quantity is provided" do
      product = @category.products.create({name: 'New Product', price: '12345', quantity: 10})
      expect(product.errors.full_messages).to_not include ("Quantity can't be blank")
    end

    it "fail to create a new product when product quantity is not provided" do
      product = @category.products.create({name: 'New Product', price: '12345', quantity: nil})
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

  end
end