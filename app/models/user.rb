class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name, :last_name, :age
  validates_inclusion_of :gender, in: %w(Male Female Other)
  validates :age, numericality: { greater_than_or_equal_to: 16, less_than_or_equal_to: 120 }

  has_many :boards
  has_many :houses, dependent: :destroy
end
