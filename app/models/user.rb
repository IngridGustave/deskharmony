class User < ApplicationRecord
  validates :first_name, :last_name, presence: true
  validates :job_title, length: { minimum: 4 }, presence: true
  # has_one_attached :photo
  has_many :appointments
  has_many :appointments_as_owner, through: :desks, source: :appointments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
