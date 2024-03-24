class User < ApplicationRecord
  validates :first_name, :last_name, presence: true
  validates :job_title, length: { minimum: 3 }, presence: true
  # has_one_attached :photo
  has_many :appointments, dependent: :destroy
  has_many :team_users
  has_many :messages ,dependent: :destroy
  has_many :appointments_as_owner, through: :desks, source: :appointments
  has_many :teams, through: :team_users
  has_one_attached :photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
