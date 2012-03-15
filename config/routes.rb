Tagit::Engine.routes.draw do
  match '/current' => 'versions#current', :as => 'current_version'
  match '/' => 'versions#index', :as => 'versions'
  match '/:name' => 'versions#show', :as => 'version'
end
