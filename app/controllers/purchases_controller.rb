class PurchasesController < ApplicationController
  require 'payjp'
  before_action :set_product, only: [:pay]

  def index
    @product=Product.find(params[:id])
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    price = @product.price
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    amount: price,
    customer: card.customer_id,
    currency: 'jpy',
  )   
    
    redirect_to root_path
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

end
