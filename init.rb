require_dependency 'polls_hook_listener'

Redmine::Plugin.register :polls do
  name 'Polls plugin, 투표 플로그인'
  author 'Happyland HangBuJang, 행복랜드 행부장'
  description 'This is a plugin for Redmine, 레드마인 플러그인'
  version '0.0.1'
  url 'http://sns4u.tistory.com/485'
  author_url 'http://sns4u.tistory.com'
  
  #permission, menu
  permission :polls, { :polls => [:index, :vote] }, :public => true
  menu :project_menu, :polls, { :controller => 'polls', :action => 'index' }, :caption => 'Polls', :after => :activity, :param => :project_id
  
  #delete menu
  delete_menu_item :top_menu, :my_page
  delete_menu_item :top_menu, :help
  delete_menu_item :project_menu, :overview
  delete_menu_item :project_menu, :activity
  delete_menu_item :project_menu, :news
  
  #add new permission
  project_module :polls do
    permission :view_polls, :polls => :index
    permission :vote_polls, :polls => :vote
  end
  
  ## enabled by adding the "settings"
   settings :default => {'empty' => true}, :partial => 'settings/polls_settings'
end
