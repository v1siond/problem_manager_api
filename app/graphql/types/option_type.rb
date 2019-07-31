module Types
  class OptionType < Types::BaseObject
    field :correct_answer, Boolean, null: false
    field :body, String, null: false
  end
end
