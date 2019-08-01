class Mutations::EditQuestion < Mutations::BaseMutations
  argument :question_id, ID, required: true
  argument :title, String, required: true
  argument :body, String, required: true
  argument :options, [Inputs::OptionEditInput], required: false
  argument :delete_options, [Inputs::OptionEditInput], required: false
  argument :new_options, [Inputs::OptionInput], required: false

  field :question, Types::QuestionType, null: false
  field :errors, [String], null: false

  def resolve(question_id:, title:, body:, options:, new_options:, delete_options:)
    if context[:current_user].blank?
      raise GraphQL::ExecutionError, 'Authentication required'
    end
    question = Question.find_by(id: question_id)
    question.update!(title: title, body: body)
    options.each do |option|
      currentOption = Option.find_by(id: option[:id])
      currentOption.update!(correct_answer: option[:correct_answer], body: option[:body])
    end

    delete_options.each do |option|
      currentOption = Option.find_by(id: option[:id])
      currentOption.destroy!
    end

    new_options.each do |option|
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
