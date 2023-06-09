class AddPublicToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :public, :boolean
  end
end
