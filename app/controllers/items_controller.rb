class ItemsController < ApplicationController

  def show
  end

  def new
    @product = Product.new
  end

  def purchasing
  end

  def create
    Product.create(product_params)
  end

  private
  def product_params
    params.permit(:name)
  end

end
