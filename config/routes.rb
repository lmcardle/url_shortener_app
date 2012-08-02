UrlShortenerApp::Application.routes.draw do

  as :user do
    match 'sign_in' => 'devise/sessions#new'
    match 'sign_out' => 'devise/sessions#destroy'
  end
  
  devise_for :users
  
  resources :users
  resources :links
  
  root to: "links#new"


  match ':short_url' => 'link_redirects#show'
end
