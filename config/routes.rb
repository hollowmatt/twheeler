Twheeler::Application.routes.draw do
  root :to => 'home#index'

  match 'login' => 'home#login', :as => :login
  match 'welcome/:id' => 'home#welcome', :as => :welcome
  match "/about", to: "home#about"

end
