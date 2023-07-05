json.extract! book, :id, :title, :body, :views, :category, :created_at, :updated_at
json.url book_url(book, format: :json)
