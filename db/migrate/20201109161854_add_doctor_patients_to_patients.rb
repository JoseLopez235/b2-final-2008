class AddDoctorPatientsToPatients < ActiveRecord::Migration[5.2]
  def change
    add_reference :patients, :doctor_patients, foreign_key: true
  end
end
