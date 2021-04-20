# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

get '/webhooks', action: :index, controller: 'webhook_client'
get '/webhooks/new', action: :new, controller: 'webhook_client'
post '/webhooks', action: :create, controller: 'webhook_client'
get '/webhooks/:id/edit', action: :edit, controller: 'webhook_client'
patch '/webhooks/:id', action: :update, controller: 'webhook_client'
delete '/webhooks/:id', action: :destroy, controller: 'webhook_client'
