# == Schema Information
#
# Table name: books
#
#  id         :bigint           not null, primary key
#  body       :text
#  category   :string
#  metadata   :jsonb
#  title      :string
#  views      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Book < ApplicationRecord

end
