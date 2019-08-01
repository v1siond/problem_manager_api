module Types
  class QueryType < Types::BaseObject

    field :questions, [Types::QuestionType], null: false

    def questions
      if context[:current_user].blank?
        raise GraphQL::ExecutionError, 'Authentication required'
      end
      context[:current_user]&.questions || false
    end

    field :question, Types::QuestionType, null: false do
      argument :id, ID, required: true
    end

    def question(id:)
      if context[:current_user].blank?
        raise GraphQL::ExecutionError, 'Authentication required'
      end
      Question.find(id)
    end
  end
end