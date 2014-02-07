ToTheMarket::Application.routes.draw do
  get "products/app/controllers/api/v1"
  namespace :api do
    namespace :v1 do
      resources :markets, :only => [:index, :show], :defaults => {:format => 'json'} do
        resources :products, :only => [:index]
        resources :payment_types, :only => [:index]
        resources :schedules, :only => [:index]
      end
    end
  end
end
