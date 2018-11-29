class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.belongs_to :user, foreign_key: true
      t.float :price
      t.boolean :mobile
      t.string :city
      t.text :description

      t.timestamps
    end
  end
end
