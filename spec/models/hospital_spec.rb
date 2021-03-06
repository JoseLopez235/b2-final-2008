require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe "Relationships" do
    it {should (have_many :doctors)}
  end

  describe "Instance Methods" do
    it ".uniq_university" do
      hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      doctor_1 = Doctor.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University", hospital_id: hospital.id)
      doctor_2 = Doctor.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University", hospital_id: hospital.id)
      doctor_3 = Doctor.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University", hospital_id: hospital.id)
      doctor_4 = Doctor.create!(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", university: "University of Pennsylvania", hospital_id: hospital.id)
      doctor_5 = Doctor.create!(name: "Jose Lopez", specialty: "Brain Surgeon", university: "Harvard University", hospital_id: hospital.id)

      expecting = ["Harvard University", "Johns Hopkins University", "Stanford University", "University of Pennsylvania"]
      expect(hospital.uniq_university).to eq(expecting)
    end
  end
end
