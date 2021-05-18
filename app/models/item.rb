class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :product_status, :shipping_charge, :prefecture, :day_to_ship

  has_one_attached :image
  validates :image,               presence: true
  validates :product_name,        presence: true
  validates :product_description, presence: true
  validates :category_id,         presence: true, numericality: { other_than: 1 }
  validates :product_status_id,   presence: true, numericality: { other_than: 1 }
  validates :shipping_charge_id,  presence: true, numericality: { other_than: 1 }
  validates :prefecture_id,       presence: true
  validates :day_to_ship_id,      presence: true, numericality: { other_than: 1 }
  validates :price,               presence: true,
                                  numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  belongs_to :user
end
