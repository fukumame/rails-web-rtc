# == Schema Information
#
# Table name: rooms
#
#  id         :bigint(8)        not null, primary key
#  key        :string(100)      not null
#  name       :string(150)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)        not null
#
# Indexes
#
#  index_rooms_on_key      (key) UNIQUE
#  index_rooms_on_user_id  (user_id)
#

class Room < ApplicationRecord
  belongs_to :user
  validates :key, uniqueness: true
end
