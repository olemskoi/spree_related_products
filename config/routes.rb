Rails.application.routes.draw do

  namespace :admin do
    resources :relation_types
    resources :products do
      get :related, :on => :member
      resources :relations
    end

    resources :taxonomies do
      resources :taxons do
        get :related, :on => :member
        resources :relations
      end
    end

    resources :taxons, :only => :index, :format => :json
  end
end
