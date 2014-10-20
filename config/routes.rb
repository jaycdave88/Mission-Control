Rails.application.routes.draw do
  root 'stickies#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

    resources :users

    resources :sessions, only: [:new, :create, :destroy]

    get 'stickies/:sticky_id/helps/:id/recent/:date' => 'helps#recent', as: :recent_sticky_helps

    resources :stickies do
      resources :helps
    end
end
