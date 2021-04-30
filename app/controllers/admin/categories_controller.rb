class Admin::CategoriesController < ApplicationController

  #http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD']
  before_filter :authorize


  def index
    # @categories = Category.order(id:).all
    @categories = Category.order(id: :asc).all
    render 'index'
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(
      :id,
      :name
    )
  end

end
