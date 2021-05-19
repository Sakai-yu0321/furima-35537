class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_status
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :day_to_ship

  with_options presence: true do
    validates :image, :product_name, :product_description, :category_id, :product_status_id, :shipping_charge_id, :prefecture_id,
              :day_to_ship_id, :price
  end

  has_one_attached :image
  validates :category_id,         numericality: { other_than: 1 }
  validates :product_status_id,   numericality: { other_than: 1 }
  validates :shipping_charge_id,  numericality: { other_than: 1 }
  validates :prefecture_id,       numericality: { other_than: 0 }
  validates :day_to_ship_id,      numericality: { other_than: 1 }
  validates :price,
            numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  belongs_to :user
  has_one :purchase
end
