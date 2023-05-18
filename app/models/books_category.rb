# == Schema Information
#
# Table name: books_categories
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  book_id     :bigint
#  category_id :bigint
#
# Indexes
#
#  index_books_categories_on_book_id      (book_id)
#  index_books_categories_on_category_id  (category_id)
#
class BooksCategory < ApplicationRecord

  belongs_to :book
  belongs_to :category


end
