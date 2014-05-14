class AddStateToPages < ActiveRecord::Migration
  def change
    add_column :pages, :state, :integer
  end
end
