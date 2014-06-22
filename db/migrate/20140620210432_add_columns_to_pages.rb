class AddColumnsToPages < ActiveRecord::Migration
  def change
    add_column :pages, :menu_title, :string
    add_column :pages, :forward_url, :string
  end
end
