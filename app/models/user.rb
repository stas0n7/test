# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  admin                  :boolean          default(FALSE)
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  provider               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  uid                    :string
#  user_name              :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  after_create :confirmation_email

  def self.from_omniauth(auth)
    name_split = auth.info.name.split(" ")
    user = User.find_by(email: auth.info.email)
    user ||= User.create!(provider: auth.provider,
                          uid: auth.uid,
                          user_name: "#{name_split[0]} #{name_split[1]}",
                          email: auth.info.email,
                          password: Devise.friendly_token[0, 20])
    user
  end

  private

  def confirmation_email
    UserMailer.confirmation(id).deliver_later
  end
end
