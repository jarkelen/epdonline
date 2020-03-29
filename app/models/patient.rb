class Patient < ApplicationRecord
  has_many :treatments, dependent: :destroy

  validates :first_name, :last_name, :bsn, :birthdate, :gender, presence: true
end
