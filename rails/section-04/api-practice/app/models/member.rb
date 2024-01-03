class Member < ApplicationRecord
  validates :first_name, presence: true
  validates :first_name, presence: true
  validates :user_id, presence: true

  belongs_to :user
  has_many :facts, dependent: :restrict_with_error
end
