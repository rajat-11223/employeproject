Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


scope 'employes' do
   get 'relocation_requests', to: 'employes#relocation_requests', as: :relocation_requests     
  end
resources :employes

 

  post "employe_city" => "employes#employe_city", as: :employe_city
    
  
  #resources :manager
  resources :cities

  get "managers" => "employes#managers", as: :managers
#{}"reply_popup" =>"comments#reply_popup", as: :reply_popup
    #root :to => "manager#homepage"




end
