module ProductsHelper

# 値段を区切るメソッドです 安井
  def converting_to_jpy(price)
    "#{price.to_s(:delimited, delimiter: ',')}"
  end
  
end
