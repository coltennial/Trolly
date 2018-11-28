class Task < ApplicationRecord
  belongs_to :task

  def task_name
    "#{self.name}"
  end

  def self.all_tasks(list_id)
    Task.find_by_sql(["
      SELECT * 
      FROM tasks AS l 
      WHERE l.list_id = #{list_id}  
    "])
  end 

  def self.single_task(task_id)
    Task.find_by_sql(["
      SELECT * 
      FROM tasks AS l
      WHERE l.id = ?  
    ", task_id]).first
  end

  def self.create_task(p, task_id)
    Task.find_by_sql(["
      INSERT INTO tasks (name, list_id, created_at, updated_at)
      VALUES (:name, :list_id, :created_at, :updated_at);  
    ",{
      name: p[:name],
      list_id: task_id,
      created_at: DateTime.now,
      updated_at: DateTime.now
    }]) 

  end

  def self.update_task(task_id, p)
    Task.find_by_sql(["
      UPDATE tasks AS l 
      SET name = ?, updated_at = ?
      WHERE l.id = ?;
    ", p[:name], DateTime.now, task_id
  ])
  end

  def self.delete_task(task_id)
    Task.find_by_sql(["
      DELETE FROM tasks AS l 
      WHERER l.id = ?  
    ;", task_id]) 

  end
end
