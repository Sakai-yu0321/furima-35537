class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :last_name
    validates :first_name
  end
  
  with_options presence: true, format: { with: /\A[ァ-ヶ一]+\z/, message: '全角カナ文字を使用してください' } do
    validates :kana_last_name
    validates :kana_first_name
  end
  
  validates :birthday, presence: true
end
