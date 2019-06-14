class ProductsController < ApplicationController
  before_action :set_product, only: [:destroy, :edit] 

  def index
  
    @category1 = Category.find(1)
    @products1 = @category1.products.recent

    @category2 = Category.find(2)
    @products2 = @category2.products.recent

    @category3 = Category.find(3)
    @products3 = @category3.products.recent

  end

  def show
    @product = Product.find(40)       #商品情報
    @user = User.find(1)                                               #ユーザー情報
    @address = Address.find(1)                                         #住所情報
    @prefecture = Prefecture.find(25)   #都道府県
    @item_status = ItemStatus.find(3)           #商品の状態（新品など）
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

  def edit
  end

  def destroy
    if @product.saler_id == current_user.id
      @product.destroy
      redirect_to root_path
    else
      redirect_to action: :show
    end
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :publish_status, :text, :size, :shipping_charges, :shipping_origin_area, :days_to_ship, :item_status, images: []).merge(saler_id: 1)
  end


end
