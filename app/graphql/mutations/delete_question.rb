class Mutations::DeleteQuestion < Mutations::BaseMutations
  argument :id, ID, required: true

  field :errors, [String], null: false

  def resolve(id:)
    if context[:current_user].blank?
      raise GraphQL::ExecutionError, 'Authentication required'
    end
    question = Question.find(id)
    if question.destroy
      {
        message: 'Question deleted',
        errors: [],
      }
    else
      {
        errors: question.errors.full_messages
      }
    end
  end
end
