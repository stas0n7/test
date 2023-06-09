class CreateBook < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :name
      t.integer :position
      t.integer :views
      t.belongs_to :user

      t.timestamps
    end
  end
end
