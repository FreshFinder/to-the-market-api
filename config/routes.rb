ToTheMarket::Application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :markets, :only => [:index]
    end
  end
end
