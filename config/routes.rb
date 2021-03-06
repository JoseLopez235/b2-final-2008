Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #doctors
  get '/doctors/:id', to: 'doctors#show'
  delete '/doctors/:id/:patient_id', to: 'doctors#destroy'

  #hospitals
  get '/hospitals/:id', to: 'hospitals#show'

  #patients
  get '/patients', to: 'patients#index'
end
