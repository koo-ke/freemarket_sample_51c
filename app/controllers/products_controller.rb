class ProductsController < ApplicationController
  def index
  
    @category1 = Category.find(1)
    @products1 = @category1.products.recent

    @category2 = Category.find(2)
    @products2 = @category2.products.recent

    @category3 = Category.find(3)
    @products3 = @category3.products.recent

  end

  def new
    @product = Product.new
  end

  def create
    Product.create!(product_params)
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :publish_status, :text, :size, :shipping_charges, :shipping_origin_area, :days_to_ship, :buyer_id, :item_status, images: []).merge(saler_id: 1)
  end
end
