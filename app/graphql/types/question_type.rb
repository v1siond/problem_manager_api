module Types
  class QuestionType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :body, String, null: false
    field :options, [Types::OptionType], null: true
  end
end