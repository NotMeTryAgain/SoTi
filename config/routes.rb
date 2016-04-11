Rails.application.routes.draw do
  devise_for :users
  root "posts#index"

  resources :posts do
    resources :reviews, only: [:create, :edit, :update, :destroy]
  end

  resources :reviews do
    resources :votes do
      collection do
        post 'upvote'
        post 'downvote'
      end
    end
  end
end
