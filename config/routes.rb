ActionController::Routing::Routes.draw do |map|
  
  map.resources :heroes, :collection => {:year => :get}
  map.resources :nominations, :new => {:new => :any}
  map.resources :sites, :collection => {:search => :get}, :has_many=>:nominations
  
  map.root :controller => "sites", :action => "search"

  # Install the default routes as the lowest priority.
  # Leave 'em out, we're RESTful
  # map.connect ':controller/:action/:id'
  # map.connect ':controller/:action/:id.:format'
end
