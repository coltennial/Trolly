class Task < ApplicationRecord
  belongs_to :task


  def task_name
    "#{self.name}"
  end

end
