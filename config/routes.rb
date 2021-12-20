Rails.application.routes.draw do
  resources :bookings do
    collection do
      get 'report'
    end
  end
  resources :saloons do
    resources :schedules
    resources :chairs
    resources :services do
      resources :slots, only: [:index, :create]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
