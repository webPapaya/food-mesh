Food::Application.routes.draw do
  get "sessions/new"
  get "users/new", as: 'user_new'
  resources :basic_pages

  resources :daily_intakes

  root to: 'basic_pages#show', :id => '52c55eb374686f1d63210000'

  scope '/:locale' do
    scope '/food/item' do
      #food item
      match '/:item_id', to: 'food_item#show', as: 'get_food_item', via: :get
      match '/add_to_basket/:item_id', to: 'user_session#add_items_to_basket', via: [:post, :get], as: 'add_item_to_basket'
      match '/delete_from_basket/:item_id', to: 'user_session#delete_item_from_basket', via: [:post, :get], as: 'delete_item_from_basket'
      match '/delete_items_from_basket/', to: 'user_session#delete_all_items', via: [:post, :get], as: 'bulk_delete_basket'
    end

    #search
    match '/search/:query', to: 'food_item#search', as: 'search_db', via: :get
    match '/compare', to: 'food_item#compare', as: 'compare_items', via: :get
  end

  match '/change/url/to/:locale(/:query)', to: 'application#change_lang', via: [:get, :post], as: 'change_lang'


  #user session
  match '/user_session/change_user_settings', to: 'user_session#change_user_settings', :via => [:post]
  resources :line_charts


  get ':controller(/:action(/:id(.:format)))'

  resources 'pie_chart'
  resources 'basic_pages'

  #admin login
  get '/logout' => "sessions#destroy", :as => "logout"
  get '/admin' => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  resources :users
  resources :sessions


  get '/admin_dashboard' => 'admin_dashboard#index', as: 'dashboard'

end
