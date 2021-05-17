class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :product_status, :shipping_charge, :prefecture, :day_to_ship
end
