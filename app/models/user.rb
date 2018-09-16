class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable,
  # :recoverable, :rememberable
  devise :database_authenticatable, :registerable, :validatable, 
          :omniauthable, :omniauth_providers => [:facebook]

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  #validations
  validates :user_name,  :email, :password, presence: true
  validates :email, uniqueness: true
  validates :email, format: {with: VALID_EMAIL_REGEX,
    message: I18n.t("model.user.valid_email") }
  validates :password, length: { minimum: 3,
    message: I18n.t("model.user.valid_password")}

  # association
  has_one :provider, dependent: :destroy

end
