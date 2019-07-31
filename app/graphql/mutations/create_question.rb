class Mutations::CreateQuestion < Mutations::BaseMutations
  argument :title, String, required: true
  argument :body, String, required: true

  field :question, Types::QuestionType, null: false
  field :errors, [String], null: false

  def resolve(title:, body:)
    question = Question.new(user_id: context[:current_user].id, title: title, body: body)
    if question.save
      {
        question: question,
        errors: [],
      }
    else
      {
        question: nil,
        errors: question.errors.full_messages
      }
    end
  end
end
