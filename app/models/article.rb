# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  body       :text
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Article < ApplicationRecord
  has_one :cover, as: :attachmentable, class_name: 'Attachment', dependent: :destroy
  accepts_nested_attributes_for :cover

  validates :body, presence: true
end
