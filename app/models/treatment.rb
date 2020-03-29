class Treatment < ApplicationRecord
  belongs_to :patient
  validates :treatment_date, :name, :patient_id, presence: true
end
