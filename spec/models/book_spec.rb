require 'rails_helper'

RSpec.describe Book, type: :model do
  let!(:book) { Book.create(name: 'Star wars', views: 2, position: 5) }

  it 'book info' do
    expect(book.info).to eq('Star wars with posiition 5 and views 2')
  end
end
