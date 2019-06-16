class RegistersController < ApplicationController
 
 def memberinfo
 end

 def numberverification
 end

 def memberaddfress
 
 end

 def create
  Address.create(address_params)
  redirect_to payment_registers_path
 end


 def payment
 end

 def completion
 end

  private
  def address_params
    params.require(:address).permit(:postal_code, :prefecture, :city, :address,:building).merge(user_id: current_user.id)
  end

end
