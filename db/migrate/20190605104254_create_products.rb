class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|

      t.string        :name,                      null: false, index: true
      t.integer       :price,                     null: false
      t.integer       :publish_status,            null: false, default: 0
      t.text          :text,                      null: false
      t.string        :size,                      null: false, default: 0
      t.integer       :item_status,               null: false
      t.string        :shipping_charges,          null: false
      t.string        :shipping_origin_area,      null: false
      t.string        :days_to_ship,              null: false
      t.integer       :saler_id,                  null: false, foreign_key: true
      t.integer       :buyer_id,                  null: false, foreign_key: true

      t.timestamps
    end
  end
end
