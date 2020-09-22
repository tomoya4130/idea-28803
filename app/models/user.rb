class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :ideas
  has_many :comments
  has_many :likes

  before_save { self.email = email.downcase }
  
  with_options presence: true do
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])\w{6,}\z/.freeze
    validates :nickname, length: { maximum: 20 }
    validates :email, format: { with: VALID_EMAIL_REGEX, message: "can't be blank" }, uniqueness: { case_sensitive: false } # 一意性制約
    validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'Include both letters and numbers' }
    validates :password, confirmation: true
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters' }
    validates :birthday
  end
end
