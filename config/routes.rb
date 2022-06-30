Rails.application.routes.draw do
  root to: "pages#home"
  resources :bookings, only: [:new, :create, :show]
end
