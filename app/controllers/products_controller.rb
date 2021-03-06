class ProductsController < ApplicationController
  before_action :set_product, only: [:destroy, :edit] 

  def index

    @tempitems1 = []
    @category1 = Category.find(1,2,3,4,5,6,7,8,9,10,11,12,13,14)
    @category1.map{|category| @tempitems1 << category.products}
    @tempitems2 = @tempitems1.flatten
    @tempitems3 = Product.where(id: @tempitems2.map{ |item| item.id })
    @products1 = @tempitems3.order("created_at DESC").first(4)
    # 元々
    # @category1 = Category.find(1)
    # @products1 = @category1.products.recent

    @tempitems4 = []
    @category2 = Category.find(15,16,17,18,19,20,21,22,23,24,25,26,27,28)
    @category2.map{|category| @tempitems4 << category.products}
    @tempitems5 = @tempitems4.flatten
    @tempitems6 = Product.where(id: @tempitems5.map{ |item| item.id })
    @products2 = @tempitems6.order("created_at DESC").first(4)

    @tempitems7 = []
    @category3 = Category.find(29,30,31,32,33,34,35,36,37,38,39,40,41)
    @category3.map{|category| @tempitems7 << category.products}
    @tempitems8 = @tempitems7.flatten
    @tempitems9 = Product.where(id: @tempitems8.map{ |item| item.id })
    @products3 = @tempitems9.order("created_at DESC").first(4)

  end

  def show
    @product = Product.find(params[:id])
    @saler = User.find(id= @product.saler_id)
    @prefecture = Prefecture.find(@product.shipping_origin_area_was)
    @item_status = ItemStatus.find(@product.item_status_was)
    @category = Category.find_by(id: @product.category_ids)
  end
  
  def new
    if user_signed_in?
      @product = Product.new
      @product.product_categories.build #城戸追記(6/14)
    else 
      flash[:notice] = "ログインしてください" 
      redirect_to login_users_path
    end  
      # @parents = Category.where(id:1,id:15,id:29)
  end

  def search

    respond_to do |format|
      format.html
      format.json do
      if params[:parent_id]
       @children = Category.find(params[:parent_id]).children
      else
       @grandchildren = Category.find(params[:children_id]).children
      end
     
       #  binding.pry


       #親ボックスのidから子ボックスのidの配列を作成してインスタンス変数で定義
      end
    end
  end

  def create
    # @product = Product.new(product_params)  #城戸追記(6/14)
    Product.create!(product_params)
    # save的な何か
    redirect_to root_path
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
      redirect_to action: :edit, notice: "全項目入力できていません"
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
    params.require(:product).permit(:name, :price, :buyer_id, :publish_status, :text, :size, :shipping_charges, :shipping_origin_area, :days_to_ship, :item_status, :category_ids, images: []).merge(saler_id: current_user.id)
  end


end
