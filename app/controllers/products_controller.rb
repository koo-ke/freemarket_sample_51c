class ProductsController < ApplicationController
  def index
  end

  def show
  end
  
  def new
    @product = Product.new
  end

  def create
    Product.create!(product_params)
    redirect_to root_path
  end

  def purchasing
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :publish_status, :text, :size, :shipping_charges, :shipping_origin_area, :days_to_ship, :buyer_id, :item_status, images: []).merge(saler_id: 1)
  end
end
