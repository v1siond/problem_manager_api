module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :create_question, mutation: Mutations::CreateQuestion
    field :edit_question, mutation: Mutations::EditQuestion
    field :delete_question, mutation: Mutations::DeleteQuestion
    field :create_option, mutation: Mutations::CreateOption
    field :delete_option, mutation: Mutations::DeleteOption
    field :login, mutation: Mutations::Login
  end
end