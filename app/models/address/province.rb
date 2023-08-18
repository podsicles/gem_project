class Address::Province < ApplicationRecord
  validates :name, presence: true
  validates :code, uniqueness: true

  belongs_to :region
  has_many :districts, class_name: 'Address::Province', foreign_key: :province_id
end
