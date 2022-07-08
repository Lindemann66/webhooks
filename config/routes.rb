# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :organizations, only: %i[show] do
    resources :projects, only: %i[index create show update destroy]
  end

  resources :projects, only: [] do
    resources :tasks, only: %i[index create show update destroy]
  end

  post :authenticate, to: 'authentication#authenticate_user'
end
