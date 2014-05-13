Mascotas::Application.routes.draw do
  root to: 'visitantes#new'

  get "/pages/*id", to:'pages#show'

resources :contactos, only: [:new, :create]
resources :visitantes, only: [:new, :create]
end
