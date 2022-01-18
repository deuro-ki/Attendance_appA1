Rails.application.routes.draw do

  root 'static_pages#top'
  get '/signup', to: 'users#new'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :bases do
    member do
      get 'new_base_info'
    end
  end

  resources :users do
    get 'applicants', on: :collection
    collection {post :import}
    member do
      get 'edit_basic_info'
      patch 'update_basic_info'
      get 'show2'
      get 'edit2'
      get 'attendances/edit_one_month'
      patch 'attendances/update_one_month'
      patch 'basic_info'
      get 'edit_overwork_notice'
      patch 'update_overwork_notice'
      get '/attendances/edit_one_month_apply'
      patch 'attendances/update_one_month_apply'
      patch 'attendances/request_one_month_application'
      get '/attendances/edit_attendance_apply'
      patch '/attendances/update_attendance_apply'
      get '/attendances/edit_attendance_log'
    end

    resources :attendances do
      collection {post :import}
      member do
        patch 'update'
        get 'edit_overwork_request'
        patch 'update_overwork_request'
      end
    end
  end
  
  resources :attendance_change_approval_log, only: :index
end