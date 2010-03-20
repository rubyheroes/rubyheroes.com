ActionController::Routing::Routes.draw do |map|
  
  map.resources :heroes, :nominators
  map.resources :nominations, :new => {:new => :any}
  map.resources :sites, :collection => {:search => :get}, :has_many=>:nominations

  map.resource :similar_nominations_search
  map.resources :nomination_sites
  
  map.root :controller => "similar_nominations_searches", :action => "new"

  # Install the default routes as the lowest priority.
  # Leave 'em out, we're RESTful
  # map.connect ':controller/:action/:id'
  # map.connect ':controller/:action/:id.:format'
end
