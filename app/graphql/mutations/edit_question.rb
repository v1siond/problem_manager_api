class Mutations::EditQuestion < Mutations::BaseMutations
  argument :question_id, ID, required: true
  argument :title, String, required: true
  argument :body, String, required: true
  argument :options, [Inputs::OptionEditInput], required: false

  field :question, Types::QuestionType, null: false
  field :errors, [String], null: false

  def resolve(question_id:, title:, body:, options:)
    question = Question.find_by(id: question_id)
    question.update!(title: title, body: body)
    options.each do |option|
      currentOption = Option.find_by(id: option[:id])
      currentOption.update!(correct_answer: option[:correct_answer], body: option[:body])
    end
    {
      question: question,
      errors: question.errors.full_messages
    }
  end
end
