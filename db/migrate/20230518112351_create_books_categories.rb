class CreateBooksCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :books_categories do |t|
      t.belongs_to :category
      t.belongs_to :book

      t.timestamps
    end
  end
end
