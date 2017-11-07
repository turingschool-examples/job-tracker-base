Rails.application.routes.draw do

  resources :companies do
    resources :jobs
  end

  resources :jobs do
    resources :tags
  end
end
