class List < ApplicationRecord
  belongs_to :board

  has_many :tasks

  def list_name
    "#{self.name}"
  end
end
