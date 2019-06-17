# require 'rails_helper'

# describe User do
#   describe '#create' do

#     it "is valid with a nickname, email, password, password_confirmation" do
#       # ニックネーム、電子メール、パスワード、パスワード確認があれば有効
#       user = FactoryBot.build(:user)
#       expect(user).to be_valid
#     end

#     it "is invalid without a nickname" do
#       # ニックネームがないと無効
#       user = FactoryBot.build(:user, nickname: nil)
#       user.valid?
#       expect(user.errors[:nickname]).to include("can't be blank")
#     end

#     it "is invalid without a email" do
#       # メールがないと無効
#       user = FactoryBot.build(:user, email: nil)
#       user.valid?
#       expect(user.errors[:email]).to include("can't be blank")
#     end

#     it "is invalid without a password" do
#       # パスワードがないと無効
#       user = FactoryBot.build(:user, password: nil)
#       user.valid?
#       expect(user.errors[:password]).to include("can't be blank")
#     end

#     it "is invalid without a password_confirmation although with a password" do
#       # パスワード確認がないと無効
#       user = FactoryBot.build(:user, password_confirmation: "")
#       user.valid?
#       expect(user.errors[:password_confirmation]).to include("doesn't match Password")
#     end

#     it "is invalid with a duplicate email address" do
#       # メールアドレスが重複していると無効
#       user = FactoryBot.create(:user)
#       another_user =  FactoryBot.build(:user, email: user.email)
#       another_user.valid?
#       expect(another_user.errors[:email]).to include("has already been taken")
#     end

#     # it "is invalid with a nickname that has more than 7 characters " do
#     #   user = FactoryBot.build(:user, nickname: "aaaaaaaa")
#     #   user.valid?
#     #   expect(user.errors[:nickname][0]).to include("is too long")
#     # end

#     # it "is valid with a nickname that has less than 6 characters " do
#     #   user = FactoryBot.build(:user, nickname: "aaaaaa")
#     #   expect(user).to be_valid
#     # end

#     it "is invalid with a password that has less than 5 characters " do
#       # 5文字未満のパスワードは無効
#       user = FactoryBot.build(:user, password: "00000", password_confirmation: "00000")
#       user.valid?
#       expect(user.errors[:password][0]).to include("is too short")
#     end

#   end
# end

# # RSpec.describe User, type: :model do
# #   pending "add some examples to (or delete) #{__FILE__}"
# # end
