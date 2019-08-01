module Types
  class QueryType < Types::BaseObject

    field :questions, [Types::QuestionType], null: false

    def questions
      context[:current_user]&.questions || false
    end

    field :question, Types::QuestionType, null: false do
      argument :id, ID, required: true
    end

    def question(id:)
      Question.find(id)
    end
  end
end