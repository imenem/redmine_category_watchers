require 'redmine'

Redmine::Plugin.register :redmine_category_watchers do
  name 'Redmine Categorys Watcher plugin'
  author 'Max Muller <mekatum@gmail.com>'
  description 'Plugin add funcion for automatically add watchers by category'
  version '0.0.2'
  requires_redmine version_or_higher: '4.0' 
  url 'https://github.com/mekatum/redmine_category_watchers'
  #author_url 'http://example.com/about'


  permission :category_watchers, { :category_watchers => [:index, :add] }, :public => true
  
  permission :access_category_watchers, :category_watchers => :index
  permission :add_category_watchers,	:category_watchers => :add
  



   menu :project_menu, :category_watchers, { :controller => 'category_watchers', :action => 'index' }, 
  			:caption => :category_watchers, :after => :wiki,
  			:if => Proc.new {
    					User.current.allowed_to?(:access_category_watchers, nil, {global:true})
   			}

end


require_dependency 'redmine_category_watcher/hooks'
