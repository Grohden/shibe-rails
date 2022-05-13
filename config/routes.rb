Rails.application.routes.draw do
  mount GraphqlPlayground::Rails::Engine, at: "/playground", graphql_path: "/graphql"
  mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"

  post "/graphql", to: "graphql#execute"

  namespace :api do
    resources :users, only: %i[show index] do
      resources :tags, only: %i[index]
    end
  end
end
