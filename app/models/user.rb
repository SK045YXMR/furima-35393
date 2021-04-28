class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
          with_options presence: true do
            validates :nickname
            validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'First name Full-width characters' }
            validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'Last name Full-width characters' }
            validates :first_name_kana, format: { with: /\A[ァ-ヶ一-]+\z/, message: 'First name kana Full-width katakana characters' }
            validates :last_name_kana, format: { with: /\A[ァ-ヶ一-]+\z/, message: 'Last name kana Full-width katakana characters' }
            validates :birth_date
          end
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX, message: 'Password Include both letters and numbers'
  has_many :items
  has_many :purchases

end
