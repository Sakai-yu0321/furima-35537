class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :purchase_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, numericality: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Postal code is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :municipality
    validates :address
    validates :phone_number, numericality: true, length: { minimum:10, maximum:11}, format: { with: /\A\d{10}$|^\d{11}\z/, message: "Phone number is invalid. Input only number"}
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, munucipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end