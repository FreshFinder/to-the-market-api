ToTheMarket::Application.routes.draw do
  get "products/app/controllers/api/v1"
  namespace :api do
    namespace :v1 do
      resources :markets, :only => [:index, :show] do
        resources :products, :only => [:index]
        resources :payment_types, :only => [:index]
      end
    end
  end
end
