class House < ApplicationRecord
  belongs_to :user
  validates_presence_of :price, :city, :mobile
end
