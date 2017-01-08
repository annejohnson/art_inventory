Rails.application.routes.draw do
  root to: redirect('/artworks')

  resources :artworks
  resources :media, only: [:index, :show]
end
