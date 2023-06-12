# == Schema Information
#
# Table name: books
#
#  id         :bigint           not null, primary key
#  name       :string
#  position   :integer
#  public     :boolean
#  views      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_books_on_user_id  (user_id)
#
class Book < ApplicationRecord
  belongs_to :user
  def info
    "#{name} with posiition #{position} and views #{views}"
  end
end
