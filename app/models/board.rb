class Board < ApplicationRecord
  belongs_to :user

  has_many :lists

  def board_name
    "#{self.name}"
  end

  def self.all_boards(user_id)
    Board.find_by_sql(["
      SELECT * 
      FROM boards AS b 
      WHERE b.user_id = #{user_id}  
    "])
  end 

  def self.single_board(board_id)
    Board.find_by_sql(["
      SELECT * 
      FROM boards AS b
      WHERE b.id = ?  
    ", board_id]).first
  end

  def self.create_board(p, board_id)
    Board.find_by_sql(["
      INSERT INTO boards (name, user_id, created_at, updated_at)
      VALUES (:name, :user_id, :created_at, :updated_at);  
    ",{
      name: p[:name],
      user_id: board_id,
      created_at: DateTime.now,
      updated_at: DateTime.now
    }]) 

  end

  def self.update_board(board_id, p)
    Board.find_by_sql(["
      UPDATE boards AS b 
      SET name = ?, updated_at = ?
      WHERE b.id = ?;
    ", p[:name], DateTime.now, board_id
  ])
  end

  def self.delete_board(board_id)
    Board.find_by_sql(["
      DELETE FROM boards AS b 
      WHERE b.id = ?  
    ;", board_id]) 

  end
end
