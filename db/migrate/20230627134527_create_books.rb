class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.text :body
      t.integer :views
      t.string :category
      t.jsonb :metadata, default: {}

      t.timestamps
    end
  end
end
