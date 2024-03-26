require 'date'
class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :desk
  validates :start_at, uniqueness:  { scope: :desk_id }
  validates :start_at, uniqueness:  { scope: :user_id }
end
