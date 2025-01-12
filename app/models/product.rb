class Product < ApplicationRecord
  has_one_attached :image

  scope :for_list, -> { order(:created_at) }

  def subtotal
    price * quantity
  end
end
