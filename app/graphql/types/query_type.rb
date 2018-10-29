# app/graphql/types/query_type.rb

require 'json'

module Types
  class QueryType < Types::BaseObject

    field :users, [UserType], null: false, resolve: -> (obj, args, ctx) {
        file = File.read File.join(File.dirname(__FILE__), "../data/users.json")
        data = JSON.parse(file)
    
        data.map do |user|
          g = User.new
          g.from_json(user.to_json)
        end
      }
  end
end
