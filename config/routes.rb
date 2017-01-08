Rails.application.routes.draw do
  root to: redirect('/artworks')

  resources :artworks
end
