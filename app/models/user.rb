class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  validates :email, presence: true
  validates :nickname, presence: true 
  has_many :sns_credentials, dependent: :destroy

    def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    

    if snscredential.present?
      user = User.where(id: snscredential.user_id).first
      unless user.present? 
        user = User.new(
          nickname: auth.info.name,
          email: auth.info.email
        )
      end
      sns = snscredential

    else 
      user = User.where(email: auth.info.email).first
      if user.present? 
        sns = SnsCredential.new(
          uid: uid,
          provider: provider,
          user_id: user.id
        )
      else 
        user = User.new(
          nickname: auth.info.name,
          email: auth.info.email
        )
        sns = SnsCredential.create(
          uid: uid,
          provider: provider
        )
      end
    end

    return { user: user , sns_id: sns.id }
  end


  has_one :address

  has_many :buyed_products,   foreign_key: "buyer_id",               class_name: "Products"
  has_many :saling_products,  -> { where("buyer_id is NULL") },      foreign_key: "saler_id",    class_name: "Products"
  has_many :sold_products,    -> { where("buyer_id is not NULL") },  foreign_key: "saler_id",    class_name: "Products"

end
