require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe "Relationships" do
    it {should (have_many :doctor_patients)}
    it {should (have_many :doctors).through(:doctor_patients)}
  end

  describe "Class Methods" do
    it ".patients_order" do
      patient_1 = Patient.create!(name: "Katie Bryce", age: 24)
      patient_2 = Patient.create!(name: "Denny Duquette", age: 39)
      patient_3 = Patient.create!(name: "Rebecca Pope", age: 32)
      patient_4 = Patient.create!(name: "Zola Shepherd", age: 2)

      expecting = [patient_2, patient_3, patient_1, patient_4]
      expect(Patient.patients_order).to eq(expecting)
    end
  end
end
