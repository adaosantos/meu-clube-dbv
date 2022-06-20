Rails.application.routes.draw do
  post "/api/v1/graphql", to: "graphql#execute"
end
