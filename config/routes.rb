Food::Application.routes.draw do
  root to: 'basic_pages#show', :id => 1


  #food item
  match 'food/item/:item_id', to: 'food_item#show', as: 'get_food_item', via: :get
  match 'food/item/add_to_basket/:item_id', to: 'user_session#add_items_to_basket', via: [:post, :get], as: 'add_item_to_basket'

  #search
  match 'search/:query', to: 'food_item#search', as: 'search_db', via: :get

  #user session
  match 'user_session/change_user_settings', to: 'user_session#change_user_settings', :via => [:post]

  resources :basic_pages
  resources :line_charts


  get ':controller(/:action(/:id(.:format)))'

  resources 'pie_chart'
  resources 'basic_pages'




end
