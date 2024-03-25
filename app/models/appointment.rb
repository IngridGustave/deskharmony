require 'date'
class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :desk
  validates :start_at, uniqueness:  { scope: :desk_id }
  validates :start_at, comparison: { greater_than_or_equal_to: Date.today}
end
