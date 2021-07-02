Rails.application.routes.draw do
  root to: "bills#index"
  resources :bills, only: [:index, :show]

  namespace :api do
    namespace :v1 do
      get "bills" => "bills#index"
    end
  end
end
