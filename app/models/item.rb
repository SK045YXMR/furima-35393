class Item < ApplicationRecord
  with_options presence: true do
    validates :item_name
    validates :item_example
    validates :image
    validates :price
  end

  with_options numericality: { other_than: 1 } do
    validates :item_category_id
    validates :item_status_id
    validates :shopping_charges_id
    validates :shipping_area_id
    validates :days_to_ship_id
  end

  validates :price, format: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  validates :price, length: { in: 3..7 }
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category_id
  belongs_to :item_status_id
  belongs_to :shopping_charges_id
  belongs_to :shipping_area_id
  belongs_to :days_to_ship_id

  belongs_to :user
  has_one :purchase

  has_one_attached :image
end
