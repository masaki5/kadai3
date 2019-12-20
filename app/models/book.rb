class Book < ApplicationRecord
	belongs_to :user
    #attachment :profile_image
    #has_many :books,dependent: :destroy
    validates :title, presence: true
    validates :body, presence: true
    validates :body, length: { maximum: 200 }
end
