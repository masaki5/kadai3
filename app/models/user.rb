class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,   #databaseパスワードの正確性を検証registerable ユーザ登録や編集削除
         :recoverable, :rememberable, :validatable   #recoverableパスワードリセットrememberableログイン情報を保存validatable emailのフォーマットなどのバリデーション

  #has_many :post_images, dependent: :destroy #has_manyのには1:Nの関係になるモデル名を複数形で記述
  attachment :profile_image
  has_many :books,dependent: :destroy
  validates :name, length: { in: 2..20 }
  validates :name, presence: true
  validates :introduction, length: { maximum: 50 }
end
