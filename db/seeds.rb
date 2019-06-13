# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


lady = Category.create(:name=>"レディース")

lady_tops = lady.children.create(:name=>"トップス")
lady_jacket = lady.children.create(:name=>"ジャケット/アウター")
lady_pants = lady.children.create(:name=>"パンツ")

lady_tops.children.create([{:name=>"Tシャツ/カットソー(半袖/袖なし)"}, {:name=>"キャミソール"},{:name=>"その他"}])
lady_jacket.children.create([{:name=>"テーラードジャケット"}, {:name=>"ノーカラージャケット"}, {:name=>"その他"}])
lady_pants.children.create([{:name=>"デニム"}, {:name=>"スキニーパンツ"}, {:name=>"スカート"},{:name=>"その他"}])



mens = Category.create(:name=>"メンズ")

mens_tops = mens.children.create(:name=>"トップス")
mens_jacket = mens.children.create(:name=>"ジャケット/アウター")
mens_pants = mens.children.create(:name=>"パンツ")

mens_tops.children.create([{:name=>"Tシャツ/カットソー(半袖/袖なし)"}, {:name=>"ポロシャツ"},{:name=>"その他"}])
mens_jacket.children.create([{:name=>"レザージャケット"}, {:name=>"ミリタリージャケット"}, {:name=>"その他"}])
mens_pants.children.create([{:name=>"デニム"}, {:name=>"チノパン"}, {:name=>"カーゴパンツ"},{:name=>"その他"}])



kids = Category.create(:name=>"キッズ")

kids_tops = kids.children.create(:name=>"男の子")
kids_jacket = kids.children.create(:name=>"女の子")
kids_pants = kids.children.create(:name=>"その他")

kids_tops.children.create([{:name=>"ウルトラマン"}, {:name=>"ポケモン"},{:name=>"その他"}])
kids_jacket.children.create([{:name=>"プリキュア"}, {:name=>"セーラームーン"}, {:name=>"その他"}])
kids_pants.children.create([{:name=>"おもちゃ"}, {:name=>"オムツ"},{:name=>"その他"}])