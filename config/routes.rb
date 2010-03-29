ActionController::Routing::Routes.draw do |map|
  
  map.resources :heroes
  map.connect "heroes/year/:year", :controller => "heroes", :action => "year", :year => /\d{4}/
  
  map.resources :nominations, :new => {:new => [:post]}
  map.resources :sites, :collection => {:search => :get}, :has_many=>:nominations
  
  map.root :controller => "sites", :action => "search"
end
