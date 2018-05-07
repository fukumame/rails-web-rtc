# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  access_token           :string
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  name                   :string
#  provider               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  uid                    :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord

  validates_format_of :email, with: /@cast-er.com\z/, message: 'ドメインが正しくありません'

  has_many :rooms, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  def self.find_for_google_oauth2(auth)
    user = User.where(email: auth.info.email).first
    unless user
      user = User.new(name: auth.info.name,
                      provider: auth.provider,
                      uid: auth.uid,
                      email: auth.info.email,
                      access_token: auth.credentials.token,
                      password: Devise.friendly_token[0, 20])
      # user.skip_confirmation!
      user.save
    end
    user
  end

end
