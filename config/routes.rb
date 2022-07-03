Rails.application.routes.draw do
  root to: "bookings#new"
  resources :bookings, only: %i[new create show]
end
