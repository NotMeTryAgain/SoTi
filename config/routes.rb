Rails.application.routes.draw do
  root "posts#index"

  devise_for :users
  match 'users/:id' => 'users#destroy', via: :delete, as: :admin_destroy_user
  resources :users

  resources :posts do
    resources :reviews, only: [:create, :edit, :update, :destroy]
  end

  resources :reviews do
    resources :votes do
      collection do
        post 'upvote'
        post 'downvote'
        delete 'unvote'
      end
    end
  end

  namespace :admin do
    resources :users, only: [:index]
  end
end
