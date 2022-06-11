Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # scope '/api' do
  #   namespace :person do
  #     resources :notes do
  #       collection do
  #         get :show
  #         post :create
  #       end
  #       member do
  #         delete :destroy
  #         put :update
  #       end
  #     end
  #   end
  #   namespace :property do
  #     resources :notes do
  #       collection do
  #         get :show
  #         post :create
  #       end
  #       member do
  #         delete :destroy
  #         put :update
  #       end
  #     end
  #   end
  #   resources :report_notes do
  #     collection do
  #       get :show
  #       post :create
  #       get :notes
  #     end
  #     member do
  #       delete :destroy
  #       put :update
  #     end
  #   end
  #   resources :lists do
  #     collection do
  #       get :show
  #       post :create
  #       delete :destroy
  #       put :update
  #     end
  #     member do
  #       post :report
  #       delete :reports
  #     end
  #   end
  #   resources :phone_search_tracks do
  #     collection do
  #       get :show
  #     end
  #   end
  # end
  resource :healthz, only: [:show]
end
