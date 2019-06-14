FactoryBot.define do

  factory :product do
    name                  {"パーカー"}            #商品名
    price                 {"4000"}               #値段                      integer
    publish_status        {"0"}                  #出品中か交渉中か売り切れ      integer  default: 0
    text                  {"商品説明です"}         #商品の説明
    size                  {"0"}                  #商品のサイズ               integer default: "0"
    item_status           {"1"}                  #商品状態                   integer
    shipping_charges      {"送料込み(出品者負担)"}  #送料負担 
    shipping_origin_area  {"1"}                  #発送元
    days_to_ship          {"2~3日で発送"}         #何日〜何日で発送 
    saler_id              {"1"}                  #販売ユーザーのID            integer
  end

end
