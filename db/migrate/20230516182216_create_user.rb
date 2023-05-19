class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :user_name, null: false
      t.text :description
      t.string :password_digest

      t.timestamps
    end
  end
end
