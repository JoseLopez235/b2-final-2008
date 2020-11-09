require "rails_helper"

describe "As a visitor" do
  describe "When I visit the patient index page" do
    it "I see the names of all patients listed from oldest to youngest" do
      patient_1 = Patient.create!(name: "Katie Bryce", age: 24)
      patient_2 = Patient.create!(name: "Denny Duquette", age: 39)
      patient_3 = Patient.create!(name: "Rebecca Pope", age: 32)
      patient_4 = Patient.create!(name: "Zola Shepherd", age: 2)

      visit '/patients'

      within "#patients-order" do
        expect("#{patient_1.name}, Age: 39").to appear_before("#{patient_3.name}, Age: 32")
        expect("#{patient_3.name}, Age: 32").to appear_before("#{patient_1.name}, Age: 24")
        expect("#{patient_1.name}, Age: 24").to appear_before("#{patient_4.name}, Age: 2")
        expect("#{patient_4.name}, Age: 2").to appear_after("#{patient_3.name}, Age: 24")
      end
    end
  end
end
