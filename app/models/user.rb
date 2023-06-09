# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  description     :text
#  email           :string           not null
#  password_digest :string
#  user_name       :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  has_secure_password

  has_many :books, foreign_key: :author_id
  has_one :avatar, as: :attachmentable, class_name: 'Attachment'
end
