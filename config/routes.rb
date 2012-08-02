UrlShortenerApp::Application.routes.draw do

  as :user do
    match 'sign_in' => 'devise/sessions#new'
    match 'sign_out' => 'devise/sessions#destroy'
  end
  
  match 'vanity'  => 'links#vanity_url'
  
  devise_for :users
  resources :users
  resources :links

  get "links/new"
  
  root to: "links#new"


  match ':short_url' => 'links#goto'
end
