class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_status
  belongs_to :shopping_charges
  belongs_to :shipping_area
  belongs_to :days_to_ship

  belongs_to :user
  has_one :purchase

  has_one_attached :image

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


  validates :price, format: { with: /\A[0-9]+\z/, message: 'Half-width number' }, length: { in: 3..7 }, numericality: { greater_than: 300, less_than: 10000000 }

end
