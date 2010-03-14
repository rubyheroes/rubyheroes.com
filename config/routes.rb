ActionController::Routing::Routes.draw do |map|

  map.resource :panel
  map.resource :similar_nominations_search
  
  # Unused routes
  # map.resources :categories
  # map.resources :mugshots
  
  map.resources :nominations
  map.resources :nomination_sites
  map.resources :users
  map.resources :votes

  # this line seems to need to appear before the following line
  # i'd suggest not moving them :)
  # we're not even using open_id...
  map.open_id_complete 'session', :controller => "sessions", :action => "create", :requirements => { :method => :get }
  map.resource :session

  map.login   'login',   :controller => 'sessions', :action => 'new'
  map.logout  'logout',  :controller => 'sessions', :action => 'destroy'

  map.root :controller => "similar_nominations_searches", :action => "new"

  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
