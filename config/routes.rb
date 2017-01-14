Rails.application.routes.draw do
  root to: redirect('/en/artworks')

  scope '(:locale)' do
    resources :artworks
    resources :media
  end
end
