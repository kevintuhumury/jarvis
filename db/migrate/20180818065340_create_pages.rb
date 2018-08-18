class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.string :title
      t.text :body
      t.string :menu_title
      t.string :forward_url
      t.string :slug
      t.integer :state
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.timestamps
    end

    add_index :pages, :slug
    add_index :pages, :parent_id
    add_index :pages, :lft
    add_index :pages, :rgt
  end
end
