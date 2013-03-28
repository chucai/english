English::Application.routes.draw do
  
  resources :emails do 
    collection do 
      get :display
      post :check
    end
  end

  root :to => "emails#display"
end
