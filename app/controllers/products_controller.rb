class ProductsController < ApplicationController
  before_action :set_product, only: [:destroy, :edit] 

  def index

    @tempitems1 = []
    @category1 = Category.find(1,2,3,4,5,6,7,8,9,10,11,12,13,14)
    @category1.map{|category| @tempitems1 << category.products}
    @tempitems2 = @tempitems1.flatten
    @tempitems3 = Product.where(id: @tempitems2.map{ |item| item.id })
    @products1 = @tempitems3.last(4)
    # 元々
    # @category1 = Category.find(1)
    # @products1 = @category1.products.recent

    @tempitems4 = []
    @category2 = Category.find(15,16,17,18,19,20,21,22,23,24,25,26,27,28)
    @category2.map{|category| @tempitems4 << category.products}
    @tempitems5 = @tempitems4.flatten
    @tempitems6 = Product.where(id: @tempitems5.map{ |item| item.id })
    @products2 = @tempitems6.last(4)

    @tempitems7 = []
    @category3 = Category.find(29,30,31,32,33,34,35,36,37,38,39,40,41)
    @category3.map{|category| @tempitems7 << category.products}
    @tempitems8 = @tempitems7.flatten
    @tempitems9 = Product.where(id: @tempitems8.map{ |item| item.id })
    @products3 = @tempitems9.last(4)

  end

  def show
    @product = Product.find(42)       #商品情報
    @user = User.find(1)                                               #ユーザー情報
    @address = Address.find(1)                                         #住所情報
    @prefecture = Prefecture.find(25)   #都道府県
    @item_status = ItemStatus.find(3)           #商品の状態（新品など）
  end
  
  def new
    @product = Product.new
    @product.product_categories.build #城戸追記(6/14)
    # @product.categories.build #城戸追記(6/14)
  end

  def create
    # @product = Product.new(product_params)  #城戸追記(6/14)
    Product.create!(product_params)
    # save的な何か
    redirect_to root_path
    # binding.pry
  end

  def purchasing
  end

  def edit
  end


  def update
    @product = Product.find(params[:id])
    images = @product.images.where.not(id: params[:image])
    images.each do |image|
      image.purge
    end
    if @product.update(product_params)
      redirect_to root_path
    else
      redirect_to edit_product_path
    end
  end

  def destroy
    if @product.saler_id == current_user.id
      @product.destroy
      redirect_to root_path
    else
      redirect_to action: :show, notice: "削除に失敗しました"
    end
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :publish_status, :text, :size, :shipping_charges, :shipping_origin_area, :days_to_ship, :item_status, :category_ids, images: []).merge(saler_id: 1)
  end


end
