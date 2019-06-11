class ProductsController < ApplicationController
  def index
  end

  def show
    @product = Product.find(1)                                         #商品情報
    @user = User.find(1)                                               #ユーザー情報
    @address = Address.find(1)                                         #住所情報
    @prefecture = Prefecture.find(@product.shipping_origin_area_was)   #都道府県
    @item_status = ItemStatus.find(@product.item_status_was)           #商品の状態（新品など）
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
