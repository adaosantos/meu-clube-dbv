Rails.application.routes.draw do
  post "/api/v1/graphql", to: "graphql#execute"

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphiql"
  end
end
