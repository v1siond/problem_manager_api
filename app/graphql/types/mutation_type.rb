module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :create_question, mutation: Mutations::CreateQuestion
    field :create_option, mutation: Mutations::CreateOption
    field :login, mutation: Mutations::Login
  end
end