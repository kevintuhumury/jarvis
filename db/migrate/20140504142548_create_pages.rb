class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.text :content
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.timestamps
    end

    add_index :pages, :parent_id
    add_index :pages, :lft
    add_index :pages, :rgt
  end
end
