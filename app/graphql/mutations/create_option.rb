class Mutations::CreateOption < Mutations::BaseMutations
  argument :correct_answer, Boolean, required: true
  argument :body, String, required: true
  argument :question_id, ID, required: true

  field :option, Types::OptionType, null: false
  field :errors, [String], null: false

  def resolve(body:, correct_answer:, question_id:)
    if context[:current_user].blank?
      raise GraphQL::ExecutionError, 'Authentication required'
    end
    option = Option.new(question_id: question_id, correct_answer: correct_answer, body: body)
    if option.save
      {
        option: option,
        errors: [],
      }
    else
      {
        option: nil,
        errors: option.errors.full_messages
      }
    end
  end
end
