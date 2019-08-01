class Mutations::CreateQuestion < Mutations::BaseMutations
  argument :title, String, required: true
  argument :body, String, required: true
  argument :options, [Inputs::OptionInput], required: false

  field :question, Types::QuestionType, null: false
  field :errors, [String], null: false

  def resolve(title:, body:, options:)
    if context[:current_user].blank?
      raise GraphQL::ExecutionError, 'Authentication required'
    end
    question = Question.new(user_id: context[:current_user]&.id, title: title, body: body)
    question.save!
    options.each do |option|
      question_id = question[:id]
      option = Option.new(question_id: question_id, correct_answer: option[:correct_answer], body: option[:body])
      option.save!
    end
    {
      question: question,
      errors: question.errors.full_messages
    }
  end
end
