Rails.application.routes.draw do
  resources :contacts, only: %i[index show create destroy]
end