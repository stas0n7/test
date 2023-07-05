puts 'Books creation started'
categories = %w[sport news cars boats fashion home beach it animals fish]
books_attributes = []

 categories.map do |category|
  50_000.times do |i|
    books_attributes << {
      title: "Book#{categories.index(category)}#{i}",
      category: category,
      body: Faker::Lorem.paragraph(sentence_count: 10),
      views: rand(1_000_000),
      metadata: { author: Faker::Book.author, publisher: Faker::Book.publisher, year: Faker::Date.between(from: '1980-01-01', to: '2020-01-01').year }
    }
  end
end
books_attributes.each_slice(50_000) do |batch|
  Book.insert_all(batch)
  print '.'
end
puts ''
puts 'Books creation finished'
