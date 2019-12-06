class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author 
      t.string :type 
      t.string :quote
      t.integer :user_id
    end   
  end
end
