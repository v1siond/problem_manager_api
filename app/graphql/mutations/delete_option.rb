class Mutations::DeleteOption < Mutations::BaseMutations
  argument :id, ID, required: true

  field :errors, [String], null: false

  def resolve(id:)
    option = Option.find(id)
    if option.destroy
      {
        message: 'Option deleted',
        errors: [],
      }
    else
      {
        errors: option.errors.full_messages
      }
    end
  end
end
