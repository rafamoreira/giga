class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :title
      t.string :email
      t.string :picture
      t.string :gender

      t.timestamps
    end
    add_index :users, :name
    add_index :users, :surname
    add_index :users, :email, unique: true
  end
end
