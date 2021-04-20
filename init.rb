require 'webhooks/issue_patch'

Redmine::Plugin.register :redmine_webhooks do
  name 'Webhooks plugin'
  author 'Damy van Valenberg'
  description 'Webhooks plugin for Redmine'
  version '0.0.1'
  url 'https://github.com/damyvv/redmine_webhooks'
  author_url 'https://github.com/damyvv'

  menu :top_menu, 'Webhooks', '/webhooks', :if => Proc.new {User.current.admin}
end

Rails.configuration.to_prepare do
  Issue.include(Webhooks::IssuePatch)
end
