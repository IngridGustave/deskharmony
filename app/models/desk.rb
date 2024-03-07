class Desk < ApplicationRecord
  has_many :appointments, dependent: :destroy
 # belongs_to :user  # géré par as_owner ?

  validates :name, presence: true
  validates :description, length: { minimum: 6 }
end
