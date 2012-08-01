UrlShortenerApp::Application.routes.draw do

  match 'vanity'  => 'links#vanity_url'
  
  resources :users
  resources :links
  match ':short_url' => 'links#goto'

  get "links/new"
  


  root :to => 'links#new'


end
