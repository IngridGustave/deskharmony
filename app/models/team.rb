class Team < ApplicationRecord
  has_many :team_users, dependent: :destroy
  belongs_to :user  # géré par as_owner ?

  validates :name, presence: true
  validates :description, length: { minimum: 6 }
end
