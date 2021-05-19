class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :munucipality, :address, :building_name, :phone_number, :purchase_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :munucipality
    validates :address
    validates :phone_number, format: { with: /\A\d{10}$|^\d{11}\z/ }
  end

  def save
    # 寄付情報を保存し、変数donationに代入する
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, munucipality: munucipality, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end