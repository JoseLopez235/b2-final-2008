require "rails_helper"

describe "As a visitor" do
  describe "When I visit a doctor's show page" do
    it "I see all of that doctor's information including: name, specialty, university where they got their doctorate" do
      hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      doctor = Doctor.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University", hospital_id: hospital.id)
      visit "/doctors/#{doctor.id}"

      expect(page).to have_content(doctor.name)
      expect(page).to have_content(doctor.specialty)
      expect(page).to have_content(doctor.university)
    end

    it "I see the name of the hospital where this doctor works" do
      hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      doctor = Doctor.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University", hospital_id: hospital.id)
      visit "/doctors/#{doctor.id}"

      expect(page).to have_content(hospital.name)
    end

    it "I see the names of all of the patients this doctor has" do
      hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      doctor = Doctor.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University", hospital_id: hospital.id)
      patient_1 = doctor.patients.create!(name: "Katie Bryce", age: 24)
      patient_2 = doctor.patients.create!(name: "Denny Duquette", age: 39)
      patient_3 = doctor.patients.create!(name: "Rebecca Pope", age: 32)
      patient_4 = doctor.patients.create!(name: "Zola Shepherd", age: 2)
      visit "/doctors/#{doctor.id}"

      expect(page).to have_content(patient_1.name)
      expect(page).to have_content(patient_2.name)
      expect(page).to have_content(patient_3.name)
      expect(page).to have_content(patient_4.name)
    end
  end
end
