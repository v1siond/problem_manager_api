module Mutations
  class Login < BaseMutations
    null true

    argument :email, String, required: false
    argument :password, String, required: false

    type Types::AuthType

    def resolve(email: nil, password: nil)
      # basic validation
      return unless email

      user = User.find_by email: email

      # ensures we have the correct user
      return unless user
      return unless user.authenticate(password)
      { user: user, token: AuthToken.token(user) }
    end
  end
end