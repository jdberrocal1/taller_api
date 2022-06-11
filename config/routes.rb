Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope '/api' do
    resources :users do
      collection do
        get :index
        get :show
        post :create
        # delete :destroy
        # put :update
      end
    end
    resources :roles do
      collection do
        get :index
        get :show
      end
    end
  end
  resource :healthz, only: [:show]
end
