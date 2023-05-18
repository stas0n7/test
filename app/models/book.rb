# == Schema Information
#
# Table name: books
#
#  id         :bigint           not null, primary key
#  rating     :integer          default(0)
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :bigint
#
# Indexes
#
#  index_books_on_author_id  (author_id)
#
class Book < ApplicationRecord

  has_many :books_categories
  has_many :categories, through: :books_categories

  belongs_to :author, class_name: 'User'

end
