class Patient < ApplicationRecord
  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients, dependent: :destroy

  def self.patients_order
    patients = Patient.all
    patients.order(age: :desc)
  end
end
