module Inputs
  class OptionInput < Types::BaseInputObject
    argument :body, String, required: true
    argument :correct_answer, Boolean, required: true
  end
end