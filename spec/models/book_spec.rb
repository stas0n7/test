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
require 'rails_helper'

RSpec.describe Book, type: :model do
  let!(:book) { Book.create(name: 'Star wars', views: 2, position: 5) }

  it 'book info' do
    expect(book.info).to eq('Star wars with posiition 5 and views 2')
  end
end
