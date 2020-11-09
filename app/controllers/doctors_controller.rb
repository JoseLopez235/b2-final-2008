class DoctorsController < ApplicationController
  def show
    @doctor = Doctor.find(params[:id])
  end

  def destroy
    doctor = Doctor.find(params[:id])
    Patient.find(params[:patient_id]).destroy
    redirect_to "/doctors/#{doctor.id}"
  end
end
