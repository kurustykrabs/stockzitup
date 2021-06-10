class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many_attached :images, dependent: :destroy
end
