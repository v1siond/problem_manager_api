module Types
  class OptionType < Types::BaseObject
    field :id, ID, null: false
    field :correct_answer, Boolean, null: false
    field :body, String, null: false
  end
end
