Tagit::Engine.routes.draw do
  resources :versions, :only => [] do
    collection do
      get :current
    end
  end
end
