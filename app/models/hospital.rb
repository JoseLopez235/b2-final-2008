class Hospital < ApplicationRecord
  has_many :doctors

  def uniq_university
    doctors.distinct.pluck('university')
  end
end
