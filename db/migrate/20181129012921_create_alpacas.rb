class CreateAlpacas < ActiveRecord::Migration[5.2]
  def change
    create_table :alpacas do |t|
      t.string :name
      t.string :color
      t.integer :age
      t.boolean :fluffy

      t.timestamps
    end
  end
end
