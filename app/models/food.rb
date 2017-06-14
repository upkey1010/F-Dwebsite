class Food < ApplicationRecord
	has_many :reviews
	belongs_to :category

	scope :asc_by_name, ->{order :name}
    scope :desc_by_name, ->{order name: :desc}
    scope :asc_by_price, ->{order :price}
    scope :desc_by_price, ->{order price: :desc}
end
