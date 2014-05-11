class RenamePageColumns < ActiveRecord::Migration
  def change
    rename_column :pages, :name, :title
    rename_column :pages, :content, :body
  end
end
