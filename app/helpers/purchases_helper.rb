module PurchasesHelper

  def address_to_jpy(address)
    "#{address.to_s(:phone)}"
  end

end
