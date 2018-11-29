class Alpaca < ApplicationRecord
  
  validates_presence_of :name, :color
  validates :color, uniqueness: true

# class Methods (in alpaca_spec.rb)
def self.by_name 
  order(:name)
end 

def self.by_age 
  order(:age)
end 


# Instance Methods (in alpaca_spec.rb)
  def embrace 
    self.fluffy ? "Hi" : false
  end 

  def bashful 
    !self.fluffy ? true : false 
  end

  def dye(color)
    self.update(color: color)
  end 

  def info 
    self.attributes.except("id", "created_at", "updated_at")
  end
end
