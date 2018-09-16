Rails.application.routes.draw do
	root 'home#index'
  devise_for :users, :controllers => {:registrations => "users/registrations", :omniauth_callbacks => "users/omniauth_callbacks", :sessions => "users/sessions"}


end
