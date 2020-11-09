require "rails_helper"

describe "As a visitor" do
  describe "When I visit a hospital's show page" do
    it "I see the hospital's name, I see the number of doctors that work at this hospital, and I see a unique list of universities that this hospital's doctors attended" do
      hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      doctor_1 = Doctor.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University", hospital_id: hospital.id)
      doctor_2 = Doctor.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University", hospital_id: hospital.id)
      doctor_3 = Doctor.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University", hospital_id: hospital.id)
      doctor_4 = Doctor.create!(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", university: "University of Pennsylvania", hospital_id: hospital.id)
      doctor_5 = Doctor.create!(name: "Jose Lopez", specialty: "Brain Surgeon", university: "Harvard University", hospital_id: hospital.id)

      visit "hospitals/#{hospital.id}"

      expect(page).to have_content(hospital.name)
      expect(page).to have_content("Number of Doctors: 5")
      expect(page).to have_content(doctor_1.university)
      expect(page).to have_content(doctor_2.university)
      expect(page).to have_content(doctor_3.university)
      expect(page).to have_content(doctor_4.university)
    end
  end
end
